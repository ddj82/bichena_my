package com_drink_ko;

import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProdController {
    @Autowired
    private ProdService prodService;
    @Autowired
    private ProdRevService prodRevService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/prodOne.ko")
    public String prodOne(@RequestParam(value = "p_no") String p_no, Model model) {
        ProdVO prodOne = prodService.prodOne(p_no);
        model.addAttribute("prodOne", prodOne);
        return "/WEB-INF/user/prodOneView.jsp";
    }

    @PostMapping("/prodOneRev.ko")
    @ResponseBody
    public Object prodOneRev(@RequestParam(value = "p_no") String p_no, Model model) {
        List<ProdRevVO> prodOneRev = prodRevService.prodOneRev(p_no);
        model.addAttribute("prodNotice", prodOneRev);

        Map<String, Object> prodOneRevMap = new HashMap<>();
        prodOneRevMap.put("code", "OK");
        prodOneRevMap.put("prodOneRev", prodOneRev);
        return prodOneRevMap;
    }

    @PostMapping("/prodRevInsert.ko") // 리뷰 등록
    public String prodRevInsert(ProdRevVO vo, @RequestParam(value = "o_no") String o_no)
            throws IllegalStateException, IOException {
        System.out.println("리뷰등록 : " + vo);
        MultipartFile uploadFile = vo.getUploadFile();
        String realPathREV = realPath + "imgRev/";
        File f = new File(realPathREV);
        if (!f.exists()) {
            f.mkdirs();
        }

        if (!uploadFile.isEmpty()) {
            vo.setPr_img(uploadFile.getOriginalFilename());
            // 실질적으로 파일이 설정한 경로에 업로드 되는 지점
            uploadFile.transferTo(new File(realPathREV + vo.getPr_img()));
        }

        int cnt = prodRevService.prodRevInsert(vo);

        if (cnt > 0) {
            System.out.println("등록완료");
            return "orderRevchk.ko"; // 리뷰state 처리
        } else {
            System.out.println("등록실패");
            return "redirect:/myRevList.ko";
        }
    }

    @RequestMapping("/prodRevDelete.ko")
    public String prodRevDelete(ProdRevVO vo, HttpSession session, Model model) {
        vo.setU_no((int) session.getAttribute("userNO"));
        int cnt = prodRevService.prodRevDelete(vo);
        if (cnt > 0) {
            System.out.println("삭제완료");
            return "orderRevDelchk.ko"; // 리뷰state 처리
        } else {
            System.out.println("삭제실패");
            return "redirect:/myRevList.ko";
        }
    }

    @ModelAttribute("conditionMapProd")
    public Map<String, String> searchConditionMapProd() {
        Map<String, String> conditionMapProd = new HashMap<String, String>();
        conditionMapProd.put("상품명", "pname");
        conditionMapProd.put("제조사", "pmade");
        conditionMapProd.put("상품번호", "pno");
        conditionMapProd.put("주종", "ptype");
        return conditionMapProd;
    }

    @RequestMapping("/adminProdList.ko")
    public String adminProdList(ProdVO vo, Model model,
                                @RequestParam(value = "searchCondition", required = false) String searchCondition,
                                @RequestParam(value = "searchKeyword", defaultValue = "", required = false) String searchKeyword,
                                @RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
                                @RequestParam(value = "range", required = false, defaultValue = "1") String Notrange) {

        int currPageNo = 0;
        int range = 0;
        int totalCnt = prodService.prodTotalCnt(vo);

        try {
            currPageNo = Integer.parseInt(NotcurrPageNo);
            range = (currPageNo - 1) / vo.getPageSize() + 1;
        } catch (NumberFormatException e) {
            currPageNo = 1;
            range = 1;
        }

        vo.pageInfo(currPageNo, range, totalCnt);
        if (vo.getP_name() == null) {
            vo.setP_name("");
        }
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            model.addAttribute("searchKeyword", searchKeyword);
            vo.setSearchKeyword(searchKeyword);
            System.out.println("searchKeyword : " + searchKeyword);
        }

        if (searchCondition != null && !searchCondition.isEmpty()) {
            model.addAttribute("searchCondition", searchCondition);
            vo.setSearchCondition(searchCondition);
            System.out.println("searchCondition : " + searchCondition);
        }

        List<ProdVO> adminProdList = prodService.prodList(vo);
        model.addAttribute("pagination", vo);
        model.addAttribute("adminProdList", adminProdList);
        System.out.println(adminProdList);
        return "/WEB-INF/admin/adminProdView.jsp";
    }

    @GetMapping("/adminProdDetail.ko")
    public String adminProdDetail(@RequestParam(value = "p_no") String p_no, Model model) {
        ProdVO adminProdDetail = prodService.prodOne(p_no);
        model.addAttribute("prodOne", adminProdDetail);
        return "/WEB-INF/admin/adminProdOneView.jsp";
    }

    @RequestMapping("/productDetailpage.ko")
    public String productDetailpage(@RequestParam String p_no) {
        return "/WEB-INF/product/pno" + p_no + ".jsp";
    }

    @RequestMapping("/adminProdInsertBtn.ko")
    public String adminProdInsertBtn() {
        return "/WEB-INF/admin/adminProdInsert.jsp";
    }

    @RequestMapping("/adminProdUpdateSet.ko")
    public String adminProdUpdate(@RequestParam(value = "p_no") String p_no, Model model) {
        ProdVO prodOne = prodService.prodOne(p_no);
        model.addAttribute("prodOne", prodOne);
        return "/WEB-INF/admin/adminProdUpdate.jsp";
    }

    @RequestMapping("/adminProdInsert.ko")
    public String adminProdInsert(ProdVO vo) throws IllegalStateException, IOException {
        MultipartFile uplodFile = vo.getUploadFile();
        File f = new File(realPath);
        if (!f.exists()) {
            f.mkdirs();
        }

        if (!(uplodFile == null || uplodFile.isEmpty())) {
            vo.setP_img(uplodFile.getOriginalFilename());
            uplodFile.transferTo(new File(realPath + vo.getP_img()));
        }

        int pno = prodService.getPnoMaxNum();
        String editFilename = "pno" + pno + ".jsp";
        vo.setP_no(pno);
        vo.setEditfile(editFilename);

        File file = new File(realPathJSP);
        if (!file.exists()) {
            file.mkdirs();
        }

        FileWriter fw = null;
        try {
            fw = new FileWriter(file + "/" + editFilename);
            fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
            fw.write(vo.getEdithtml());
            fw.flush();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                fw.close();
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }
        System.out.println(vo);
        int cnt = prodService.insertProduct(vo);

        if (cnt > 0) {
            System.out.println("등록완료");
            return "redirect:adminProdList.ko";
        } else {
            System.out.println("등록실패");
            return "redirect:adminProdList.ko";
        }

    }

    @RequestMapping("/adminProdUpdate.ko")
    public String adminProdUpdate(ProdVO vo) throws IllegalStateException, IOException {
        // 기존 상품정보
        ProdVO oldvo = prodService.prodOne(String.valueOf(vo.getP_no()));

        // 기존 상품 상세페이지jsp파일
        File oldFile = new File(realPathJSP + oldvo.getEditfile());
        // 기존 상품 이미지파일
        File oldImg = new File(realPath + oldvo.getP_img());
        System.out.println("옛날 파일 경로,이름:" + oldFile);
        System.out.println("옛날 사진 경로,이름:" + oldImg);
        System.out.println("업데이트할 vo :" + vo);

        MultipartFile uplodFile = vo.getUploadFile();
        File f = new File(realPath);
        if (!f.exists()) {
            f.mkdirs();
        }

        if (!(uplodFile == null || uplodFile.isEmpty())) {
            oldImg.delete(); // 기존 이미지 삭제
            vo.setP_img(uplodFile.getOriginalFilename());
            uplodFile.transferTo(new File(realPath + vo.getP_img()));
        } else {
            vo.setP_img(oldvo.getP_img());
        }

        // 기존 상품페이지jsp파일 삭제
        if (oldFile.exists()) {
            oldFile.delete(); // 파일 삭제
            System.out.println("기존 상세페이지jsp 삭제");
        }

        int pno = oldvo.getP_no();
        String editFilename = "pno" + pno + ".jsp";
        vo.setEditfile(editFilename);

        File file = new File(realPathJSP);
        if (!file.exists()) {
            file.mkdirs();
        }

        FileWriter fw = null;
        try {
            fw = new FileWriter(file + "/" + editFilename);
            fw.write("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" %>");
            fw.write(vo.getEdithtml());
            fw.flush();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                fw.close();
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }
        int cnt = prodService.updateProduct(vo);

        if (cnt > 0) {
            System.out.println("수정완료");
            return "redirect:adminProdList.ko";
        } else {
            System.out.println("수정실패");
            return "redirect:adminProdList.ko";
        }

    }

    @RequestMapping("/adminProdDelete.ko")
    public String adminProdDelete(@RequestParam("p_no") String p_no) throws IllegalStateException, IOException {
        // 기존 상품정보
        ProdVO oldvo = prodService.prodOne(p_no);

        // 기존 상품 상세페이지jsp파일
        File oldFile = new File(realPathJSP + oldvo.getEditfile());
        // 기존 상품 이미지파일
        File oldImg = new File(realPath + oldvo.getP_img());

        if (oldFile.exists()) {
            oldImg.delete(); // 기존 이미지 있으면 삭제
            System.out.println("기존 이미지 삭제");
        }

        // 기존 상품페이지jsp파일 삭제
        if (oldFile.exists()) {
            oldFile.delete(); // 상세페이지jsp 있으면 삭제
            System.out.println("기존 상세페이지jsp 삭제");
        }

        int cnt = prodService.deleteProduct(p_no);

        if (cnt > 0) {
            System.out.println("삭제완료");
            return "redirect:adminProdList.ko";
        } else {
            System.out.println("삭제실패");
            return "redirect:adminProdList.ko";
        }

    }

    @RequestMapping("adminRevList.ko")
    public String adminRevList(ProdRevVO vo,
                               @RequestParam(value = "searchCondition", defaultValue = "pname", required = false) String condition,
                               @RequestParam(value = "searchKeyword", defaultValue = "", required = false) String keyword,
                               @RequestParam(value = "currPageNo", required = false, defaultValue = "1") String NotcurrPageNo,
                               @RequestParam(value = "range", required = false, defaultValue = "1") String Notrange, Model model) {

        int currPageNo = 0;
        int range = 0;
        int totalCnt = prodRevService.revTotalCnt(vo);

        try {
            currPageNo = Integer.parseInt(NotcurrPageNo);
            range = (currPageNo - 1) / vo.getPageSize() + 1;
        } catch (NumberFormatException e) {
            currPageNo = 1;
            range = 1;
        }

        vo.pageInfo(currPageNo, range, totalCnt);
        model.addAttribute("pagination", vo);
        model.addAttribute("keyword", keyword);
        model.addAttribute("condition", condition);

        List<ProdRevVO> adminRevList = prodRevService.adminRevList(vo);
        model.addAttribute("adminRevList", adminRevList);
        return "WEB-INF/admin/adminRevList.jsp";
    }

    // 검색기능을 위한 모델 어트리뷰트
    @ModelAttribute("conditionMapRev")
    public Map<String, String> searchConditionMapRev() {
        Map<String, String> conditionMapRev = new HashMap<String, String>();
        conditionMapRev.put("상품명", "pname");
        conditionMapRev.put("상품번호", "pno");
        conditionMapRev.put("작성자", "unick");
        return conditionMapRev;
    }
}
