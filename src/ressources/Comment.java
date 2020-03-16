package ressources;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "comments")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "user")
	private User user;
	
	@Column(name = "likes")
	private int like;
	
	@Column(name = "response")
	private ArrayList<Comment> comments;
	
	@Column(name = "content")
	private String content;
}
