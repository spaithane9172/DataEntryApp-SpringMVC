package productcrudapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;


import productcrudapp.dao.ProductDao;
import productcrudapp.model.Product;

@Controller
public class MainController {
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String home(Model m) {
		List<Product> products=productDao.getProducts();
		m.addAttribute("products",products);
		return "Home";
	}
	
	@RequestMapping("/add-product")
	public String addProduct(Model m) {
		m.addAttribute("title","Add Product");
		return "add_product_form";
	}
	@RequestMapping(value="/handle-product", method=RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute Product product,HttpServletRequest request) {
		System.out.println(product);
		RedirectView redirectView = new RedirectView();
		this.productDao.createProduct(product);
		redirectView.setUrl(request.getContextPath()+"/	");
		return redirectView;
	}
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int id, HttpServletRequest request) {
		this.productDao.deleteProduct(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
	}
	
	@RequestMapping("/update/{productId}")
	public String updateForm(@PathVariable("productId") int pid, Model model) {
		Product product = this.productDao.getProduct(pid);
		System.out.println(product);
		model.addAttribute("product",product);
		return "update_form";
	}
}
