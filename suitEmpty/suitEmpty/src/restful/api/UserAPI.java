package restful.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import restful.bean.Result;
import restful.database.EM;
import restful.entity.User;

@Path("user")
public class UserAPI {
	
	
	// 账号注册
	@POST
	@Path("/signUp")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result signUp(User user) {
		// 后台API必须进行合法性校验后才能存入数据库
		// username相同
		
		
		// 存入数据库
		user.setId(0);
		user = EM.getEntityManager().merge(user);
		EM.getEntityManager().persist(user);
		EM.getEntityManager().getTransaction().commit();
		
		// 向客户端返回JSON格式的Result对象结果
		return new Result(0, "注册成功", user, "");
	}
	
	// 账号登录
	@POST
	@Path("/signIn")
	@Consumes("application/json;charset=UTF-8")
	@Produces("text/html;charset=UTF-8")
	public String signIn(User user,HttpServletRequest request) {
		
		// 数据库获取
		List<User> result = EM.getEntityManager()
				.createNamedQuery("User.signIn", User.class)
				.setParameter("username","%"+user.getUsername()+"%") 
				.getResultList();
		
		// 是否获取
		
		String a = "登录成功";
		
//		return new Result(0, "登录成功", result, "");
		return String.format("%s", a);
		
	}
	
	
}
