package com_drink_ko;

import com.drink.ko.service.QnaService;
import com.drink.ko.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class QnaController {
    @Autowired
    private QnaService qnaService;

    // 검색기능을 위한 모델 어트리뷰트
    @ModelAttribute("conditionMap")
    public Map<String, String> searchConditionMap() {
        Map<String, String> conditionMap = new HashMap<String, String>();
        conditionMap.put("제목", "TITLE");
        conditionMap.put("내용", "CONTENT");
        return conditionMap;
    }


    @RequestMapping("/qnaList.ko")
    public String qnaList(QnaVO vo,
    @RequestParam(value = "searchCondition", defaultValue = "TITLE", required = false) String condition,
    @RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
    @RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
    @RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

        int currPageNo = 0;
        int range = 0;
        int totalCnt = qnaService.qnaTotalCnt(vo);

        try {
            currPageNo = Integer.parseInt(NotcurrPageNo);
            range = (currPageNo - 1) / vo.getPageSize() + 1;
        } catch (NumberFormatException e) {
            currPageNo = 1;
            range = 1;
        }

        vo.pageInfo(currPageNo, range, totalCnt);
        model.addAttribute("pagination", vo);

        List<QnaVO> qnaList = qnaService.qnaList(vo);
        model.addAttribute("qnaList", qnaList);
        return "/WEB-INF/user/qnaList.jsp";
    }

    @RequestMapping("/qnaListMy.ko")
    public String qnaListMy(HttpSession session, QnaVO vo,
    @RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
    @RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

        if (session.getAttribute("userID") == null) {
            return "redirect:main.ko";
        }
        String q_writer = (String) session.getAttribute("userID");
        vo.setQ_writer(q_writer);
        int currPageNo = 0;
        int range = 0;
        int totalCnt = qnaService.qnaMyTotalCnt(vo);

        try {
            currPageNo = Integer.parseInt(NotcurrPageNo);
            range = (currPageNo - 1) / vo.getPageSize() + 1;
        } catch (NumberFormatException e) {
            currPageNo = 1;
            range = 1;
        }

        vo.pageInfo(currPageNo, range, totalCnt);
        model.addAttribute("paginationMy", vo);

        List<QnaVO> qnaList = qnaService.qnaListMy(vo);
        model.addAttribute("qnaList", qnaList);

        System.out.println("마이 qna리스트 : " + qnaList.toString());
        System.out.println("마이 qna리스트 : " + qnaList.size());
        return "/WEB-INF/user/qnaList.jsp";
    }

    @GetMapping("/qnaView.ko")
    public String qnaView(@RequestParam(value = "q_no") String q_no, Model model) {
        QnaVO qnaView = qnaService.qnaView(q_no);
        model.addAttribute("qnaView", qnaView);
        return "/WEB-INF/user/qnaView.jsp";
    }

    @PostMapping("/qnaAcontent.ko")
    public String qnaAcontent(QnaVO vo) {
        int cnt = qnaService.qnaAcontent(vo);

        if (cnt > 0) {
            System.out.println("답변완료");
            return "qnaState.ko?q_no=" + vo.getQ_no();
        } else {
            System.out.println("답변실패");
            return "redirect:/index.jsp";
        }
    }

    @RequestMapping("/qnaState.ko")
    public String qnaState(QnaVO vo) {
        vo.setQ_state("답변완료");
        int cnt = qnaService.qnaState(vo);

        if (cnt > 0) {
            System.out.println("상태변경완료");
        }
        return "qnaList.ko";
    }

    @GetMapping("/qnaDelete.ko")
    public String qnaDelete(@RequestParam(value = "q_no") String q_no) {
        int cnt = qnaService.qnaDelete(q_no);

        if (cnt > 0) {
            System.out.println("삭제완료");
            return "qnaList.ko";
        } else {
            System.out.println("삭제실패");
            return "redirect:/index.jsp";
        }
    }

    @GetMapping("/qnaInsertbtn.ko")
    public String qnaInsertbtn() {
        return "/WEB-INF/user/qnaInsert.jsp";
    }

    @PostMapping("/qnaInsert.ko")
    public String qnaInsert(QnaVO vo) throws IllegalStateException, IOException {
        System.out.println(vo);
        int cnt = qnaService.qnaInsert(vo);

        if (cnt > 0) {
            System.out.println("등록완료");
            return "qnaList.ko";
        } else {
            System.out.println("등록실패");
            return "redirect:main.ko";
        }
    }

    // 검색기능을 위한 모델 어트리뷰트
    @ModelAttribute("conditionMapQNA")
    public Map<String, String> searchConditionMapQNA() {
        Map<String, String> conditionMapQNA = new HashMap<String, String>();
        conditionMapQNA.put("카테고리", "q_cate");
        conditionMapQNA.put("상태", "q_state");
        conditionMapQNA.put("제목", "q_title");
        conditionMapQNA.put("작성자", "q_writer");
        return conditionMapQNA;
    }

    @RequestMapping("/adminQnaList.ko")
    public String adminqnaList(QnaVO vo,
        @RequestParam(value = "searchCondition", defaultValue = "q_cate", required = false) String condition,
        @RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
        @RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
        @RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

        int currPageNo = 0;
        int range = 0;
        int totalCnt = qnaService.qnaTotalCnt(vo);

        try {
            currPageNo = Integer.parseInt(NotcurrPageNo);
            range = (currPageNo - 1) / vo.getPageSize() + 1;
        } catch (NumberFormatException e) {
            currPageNo = 1;
            range = 1;
        }

        vo.pageInfo(currPageNo, range, totalCnt);
        if (vo.getQ_title() == null)
            vo.setQ_title("");
        model.addAttribute("pagination", vo);
        model.addAttribute("keyword", keyword);
        model.addAttribute("condition", condition);

        List<QnaVO> qnaList = qnaService.qnaList(vo);
        model.addAttribute("qnaList", qnaList);
        return "/WEB-INF/admin/adminQna.jsp";
    }

    @RequestMapping("/adminQnaView.ko")
    public String adminQnaView(@RequestParam(value = "q_no") String q_no, Model model) {
        System.out.println("관리자가 qna상세보기 : " + q_no);
        QnaVO qnaView = qnaService.qnaView(q_no);
        model.addAttribute("qnaView", qnaView);
        System.out.println(qnaView);
        return "/WEB-INF/admin/adminQnaView.jsp";
    }
}
