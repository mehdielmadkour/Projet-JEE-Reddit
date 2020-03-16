package ressources;

import java.util.ArrayList;
import java.util.List;

import javax.json.Json;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.JoinColumn;

//import com.google.gson.Gson;

@Entity
@Table(name = "subreddits")
public class SubReddit {

	@Id
	@Column(name = "subName")
	private String subName;
	
	//@ElementCollection
	//@CollectionTable(name = "posts", joinColumns = @JoinColumn(name = "subName"))
	//@Column(name = "posts")
	//private List<Post> posts;
	
	public SubReddit() {
		
	}
	
	public String getName() {
		return subName;
	}

	public void setName(String name) {
		this.subName = name;
	}
	
	//public void addPost(Post post) {
		//Gson gson = new Gson();
		//ArrayList<Post> postList = gson.fromJson(posts, ArrayList.class);
		//posts.add(post);
		//posts = gson.toJson(postList); 
	//}
	
}
