package ressources;

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
		return em.createQuery( "SELECT p FROM Post p WHERE p.subName=\"" + subName + "\"", Post.class).getResultList();
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
	
	public List<Post> getMostVotedPosts(int listSize) {
		/*
		 Fonction qui retourne les 4 (ou moins) posts les plus votés
		*/
		
		List<Post> list = em.createQuery( "SELECT p FROM Post p ORDER BY p.vote DESC", Post.class).getResultList();
		if (list.size() < 4) return list;
		else return list.subList(0, 4);
		
	}
	
	public List<Comment> getPostComments(int postId){
		
		List<Comment> list = em.createQuery( "SELECT c FROM Comment c WHERE c.postId=:postId", Comment.class).setParameter("postId", postId).getResultList();
		return list;
	}
	
	public List<SubReddit> getSubs(int listSize) {
			
		List<SubReddit> list = em.createQuery( "SELECT s FROM SubReddit s", SubReddit.class).getResultList();
		
		if (list.size() < listSize) return list;
		else return list.subList(0, listSize);
	}
	
	public void updatePost(Post post) {
		em.merge(post);
	}
	
	public Post getPost(int postId) {
		return em.find(Post.class, postId);
	}
}
