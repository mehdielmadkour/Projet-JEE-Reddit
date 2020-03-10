package recources;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;



@Stateless
public class TasksDAO {
	
	@PersistenceContext(unitName = "RedditPU")
	private EntityManager em;
	
	public void newUser(User user) {
		em.persist(user);
	}
	
	public void newPost(Post post, SubReddit sub) {
		em.persist(post);
		em.merge(sub);
	}
	
	public List<Post> getPosts(String subName) {
		return em.createQuery( "SELECT p FROM posts p WHERE p.subName=" + subName, Post.class).getResultList();
	}
	
	public void newComment(Comment comment) {
		em.persist(comment);
	}

	public void newSub(SubReddit sub) {
		em.persist(sub);
	}
	
	public SubReddit getSubRedditByName(String subName) {
		return em.find(SubReddit.class, subName);
	}
}
