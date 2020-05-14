package ressources;

import java.io.Serializable;
import java.security.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "posts")
public class Post implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "user")
	private String user;
	
	@Column(name = "url")
	private String url;
	
	@Column(name = "subName")
	private String subName;

	@Column(name = "votes")
	private int vote;
	
	@Column(name = "content")
	private String content;
	

	/*@OneToMany(
        cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.LAZY
    )
	private List<Comment> comments = new ArrayList<>();*/
	
	
	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}
	
	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	/*public List<Comment> getComments() {
		return comments;
	}

	public void addComments(Comment comment) {
		this.comments.add(comment);
	}*/

	public int getVote() {
		return vote;
	}

	public void upVote() {
		this.vote++;
	}
	
	public void downVote() {
		this.vote--;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getId() {
		return id;
	}
}
