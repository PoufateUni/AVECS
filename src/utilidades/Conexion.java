package utilidades;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import entidades.Estudiante;
import entidades.Grupo;
import entidades.Persona;
import entidades.Profesor;



public class Conexion<T> {
	private Class<T> c;
	private static EntityManager em = null;
	
	public Conexion() {
		em = this.getEm();
	}
	
	public Conexion(Class<T> c) {
		em = this.getEm();
	
		this.c = c;
	}
	
	public void setC(Class<T> c){
		this.c = c;
	}
	
	public static EntityManager getEm(){
		if ( em == null ) {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("avecs");
            em = emf.createEntityManager();
        }
		return em;
	}
	
	
	
	
	public <E> T find(E id){
		T object = (T) em.find(c, id);
	
		return object;
	}
	
	public int usuarioExists(int id, int tipo) {
		List<Estudiante> resultados=em.createQuery("select usuario.verificado from Usuario usuario where "
				+ "usuario.idUsuario ="+id+ "AND usuario.tipoUsuario="+tipo).getResultList();
		
		return resultados.size();
	}
	
	
	public int findByCodigoEstudiante(String codigo) {
		List<Estudiante> resultados=em.createQuery("select estudiante.codigo from Estudiante estudiante where "
				+ "estudiante.codigo=" +codigo).getResultList();
		
				return resultados.size();
	}
	public int findByCodigoProfesor(String codigo) {
		List<Profesor> resultados=em.createQuery("select pro.codigoProfesor from Profesor pro where "
				+ "pro.codigoProfesor=" +codigo).getResultList();
		
				return resultados.size();
	}
	
	
	public List<T> list(){
		TypedQuery<T> consulta= em.createNamedQuery(c.getSimpleName()+".findAll", c);
		List<T> lista = (List<T>) consulta.getResultList();
		return lista;
	}
	
	
	public void insert(T o){
		try {
			em.getTransaction().begin();
			em.persist(o);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//em.close();
		}
		
	}
	
	public void update(T o){
		try {
			em.getTransaction().begin();
			em.merge(o);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//em.close();
		}
		
	}
	
	public void delete(T o){
		try {
			em.getTransaction().begin();
			em.remove(o);
			em.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//em.close();
		}
		
	}
}