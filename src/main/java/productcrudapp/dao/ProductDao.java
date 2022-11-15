package productcrudapp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import productcrudapp.model.Product;

@Component
public class ProductDao {
	@Autowired
	public HibernateTemplate hibernateTemplate;
	
	@Transactional
	public void createProduct(Product product) {
		this.hibernateTemplate.saveOrUpdate(product);
	}
	
	
	public List<Product> getProducts(){
		List<Product> products=this.hibernateTemplate.loadAll(Product.class);
		return products;
	} 
	@Transactional
	public void deleteProduct(int pid) {
		Product p=hibernateTemplate.load(Product.class, pid);
		this.hibernateTemplate.delete(p);
	}
	public Product getProduct(int pid) {
		Product product= this.hibernateTemplate.get(Product.class, pid);
		return product;
	}
	
}
