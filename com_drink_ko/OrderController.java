package com_drink_ko;

import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private ProdService prodService;
    @Autowired
    private ProdRevService prodRevService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("myRevList.ko") // 마이페이지-리뷰
    public String myRevList(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        if (session.getAttribute("userNO") == null) {
            return "redirect:main.ko";
        }
        int u_no = (int) session.getAttribute("userNO");
        List<ProdRevVO> myRevList = prodRevService.myRevList(u_no);
        model.addAttribute("myRevList", myRevList);
        return "WEB-INF/user/myRevList.jsp";
    }

    @RequestMapping("/myRevIstOrder.ko") // 작성 가능한 리뷰
    @ResponseBody
    public Object myRevIstOrder(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        if (session.getAttribute("userNO") == null) {
            return "redirect:main.ko";
        }
        int u_no = (int) session.getAttribute("userNO");
        List<OrderVO> myRevIstOrder = orderService.myRevIstOrder(u_no);
        model.addAttribute("myRevIstOrder", myRevIstOrder);
        Map<String, Object> myRevIstOrderMap = new HashMap<>();
        myRevIstOrderMap.put("code", "OK");
        myRevIstOrderMap.put("myRevIstOrder", myRevIstOrder);
        return myRevIstOrderMap;
    }

    @RequestMapping("/orderRevchk.ko") // 리뷰state 처리
    public String orderRevchk(OrderVO vo) {
        System.out.println(vo);
        orderService.orderRevchk(vo);
        return "redirect:/myRevList.ko";
    }

    @RequestMapping("/orderRevDelchk.ko") // 리뷰state 처리
    public String orderRevDelchk(OrderVO vo, HttpSession session) {
        orderService.orderRevDelchk(vo);
        if (session.getAttribute("userID") != null) {
            if (session.getAttribute("userID").equals("admin")) {
                return "redirect:/adminRevList.ko";
            } else {
                return "redirect:/myRevList.ko";
            }
        } else {
            return "redirect:/main.ko";
        }
    }

    @GetMapping("/adminOrderDetail.ko")
    @ResponseBody
    public Object adminOrderDetail(@RequestParam(value = "o_no") String o_no, @RequestParam(value = "p_no") String p_no,
                                   Model model) {
        OrderVO vo = new OrderVO();
        vo.setP_no(p_no);
        vo.setO_no(o_no);
        vo = orderService.adminOrderDetail(vo);
        model.addAttribute("adminOrderDetail", vo);
        return vo;
    }
}
