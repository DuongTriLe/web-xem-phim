package edu.poly.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
	
	public static EntityManager getEntityManager() {
		
		//  EntityManagerFactory được sử dụng để tạo ra các đối tượng EntityManager,
		//  mỗi đối tượng EntityManager được sử dụng để thực hiện các thao tác truy vấn và thay đổi dữ liệu trên cơ sở dữ liệu.
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ASM-Java-4");
		return factory.createEntityManager();
	}
}