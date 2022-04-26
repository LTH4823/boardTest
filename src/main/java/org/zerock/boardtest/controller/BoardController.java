package org.zerock.boardtest.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.boardtest.dto.BoardDTO;
import org.zerock.boardtest.dto.ListDTO;
import org.zerock.boardtest.dto.ListResponseDTO;
import org.zerock.boardtest.dto.PageMaker;
import org.zerock.boardtest.service.BoardService;

import java.util.List;

@Log4j2
@Controller
@RequestMapping("/board/")
@RequiredArgsConstructor
public class BoardController{

    //Service에서 의존성 주입 받도록 생성 -> @RequiredArgsConstructor
    private final BoardService boardService;

    @GetMapping("/read/{bno}")//배열로 보일 수 있어 다중 주소 파라미터 처리 가능 대신 조금 복잡해 질 수 있음
    public String read(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model){

        log.info("========================");
        log.info(bno);
        log.info(listDTO);
        model.addAttribute("dto", boardService.getOne(bno));
        return "/board/read";
    }

    @GetMapping({"/modify/{bno}"})
    public String modifyGET(@PathVariable("bno") Integer bno, ListDTO listDTO, Model model){

        log.info("=============================");

        log.info(bno);

        log.info(listDTO);

        model.addAttribute("dto", boardService.getOne(bno));

        return "/board/modify";

    }

    @GetMapping("/")
    public String basic(){
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    //@RequestParam 디폴트 설정 및 주소 파라미터 자동 잡아주기 단 현재로서는 -100 같은 값을 주어도 그대로 되어버림 -> DTO 설정으로 이를 막음
    //public void list(@RequestParam(name = "page", defaultValue = "1", required = true) int page)
    //기본 자료형은 화면까지 전달 x -> @ModelAttribute(name = "cri") -> 특별한 데이터 자료 값을 지정하여 받을 떄 사용 3.0 이후 잘 안씀
    // 대신 Model 사용 Service 계층 생성
    public void list(ListDTO listDTO, Model model){
        log.info("board test............");
        log.info(listDTO );

//        List<BoardDTO> dtoList = boardService.getList(listDTO);
        ListResponseDTO<BoardDTO> responseDTO = boardService.getList(listDTO);

        model.addAttribute("dtoList",responseDTO.getDtoList());

        int total = responseDTO. getTotal();

        model.addAttribute("pageMaker",new PageMaker(listDTO.getPage(),total));

    }

    @GetMapping("/register")
    public void registerGET(){}

    @PostMapping("/register")
    public String registerPOST(BoardDTO boardDTO, RedirectAttributes rttr){

        log.info("----------------------");
        log.info(boardDTO);

        // 단순하게 파라미터 데이터 쏴주는 방벙
//        return "redirect:/board/list?result=123";

        // 보내고 데이터 사라짐
//        rttr.addFlashAttribute("result",123);
//        // 보내고 데이터 유지됨됨
       //        rttr.addAttribute("num",321);

        boardService.insert(boardDTO);
        rttr.addFlashAttribute("result", "insert");

        return "redirect:/board/list";
    }

    @GetMapping("/remove/{bno}")
    public String getNotSupported(){
        return "redirect:/board/list";
    }

    @PostMapping("/remove/{bno}")
    public String removePost(@PathVariable("bno") Integer bno,RedirectAttributes rttr){

        log.info("------------------");
        log.info("------------------");
        log.info("remove"+bno);
//        try{
//            Thread.sleep(1000);
//        }catch (InterruptedException e){
//            e.printStackTrace();
//        }
        boardService.remove(bno);
        log.info("------------------");
        rttr.addFlashAttribute("result","removed");
        return "redirect:/board/list";
    }

    @PostMapping("/modify/{bno}")
    public String removePost(@PathVariable("bno") Integer bno, BoardDTO boardDTO, ListDTO listDTO, RedirectAttributes rttr ){

        log.info("----------------------");
        log.info("----------------------");
        boardDTO.setBno(bno);
        log.info("modify" + boardDTO);

        boardService.update(boardDTO);

        rttr.addFlashAttribute("result", "modified");

        log.info("----------------------");

        return "redirect:/board/read/"+bno+ listDTO.getLink();

    }
}
