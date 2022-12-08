package restful.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.springframework.beans.factory.annotation.Autowired;

import restful.bean.Result;
import restful.database.EM;
import restful.entity.User;

@Path("user")
public class UserAPI {
//	@Autowired
//	private HttpServletRequest request;
	
	// 账号注册
	@POST
	@Path("/signUp")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result signUp(User user) {
		// 后台API必须进行合法性校验后才能存入数据库
		
		// 寻找相同的用户名称
		List<User> result = EM.getEntityManager()
				.createNamedQuery("User.signUp",User.class)
				.setParameter("username","%"+user.getUsername()+"%")
				.getResultList();
		
		System.out.println(result);
		
		if(result.isEmpty()) {
			// 存入数据库,错误会服务器故障
			user.setId(0);
			user = EM.getEntityManager().merge(user);
			EM.getEntityManager().persist(user);
			EM.getEntityManager().getTransaction().commit();
			
			// 向客户端返回JSON格式的Result对象结果
			return new Result(0, "注册成功", user, "");
		}else {
			// 数据库存在相同用户名称
			return new Result(-1,"注册失败，存在相同的用户名称", user, "");
		}
		
		
	}
	
	
	
	// 账号登录
	@POST
	@Path("/signIn")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result signIn(@Context HttpServletRequest request,User user) {
		
		// 数据库获取
		List<User> result = EM.getEntityManager()
				.createNamedQuery("User.signIn", User.class)
				.setParameter("username","%"+user.getUsername()+"%")
				.setParameter("password","%"+user.getPassword()+"%")
				.getResultList();
		
		// 是否获取
		if(result.isEmpty()) {
			// 未找到
			return new Result(-1, "登录失败，名称或密码错误", user, "");
		}else {
			// 找到
			request.getSession().setAttribute("user", result);
			
//			System.out.println("---------------");
//			System.out.println("---------------");
//			System.out.println(result);
//			System.out.println("---------------");
//			System.out.println("---------------");
			
			return new Result(0, "登录成功", result, "");
		}
	
		
	}
	
	
	// 个人账号管理
	@POST
	@Path("/Pinformation")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result information(@Context HttpServletRequest request,User user) {
		
		// 刷新页面数据，数据库
		List<User> result = (List<User>) request.getSession().getAttribute("user");
		
//		List<User> result = EM.getEntityManager()
//				.createNamedQuery("User.signIn", User.class)
//				.setParameter("username","%"+user.getUsername()+"%")
//				.setParameter("password","%"+user.getPassword()+"%")
//				.getResultList();


		
		return new Result(0, "登录成功", result, "");
	}
	
	
	
	
	
	
	@POST
	@Path("/update")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result update(User user) {
		// 信息修改
		EM.getEntityManager().persist(EM.getEntityManager().merge(user));
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "用户信息修改成功", user, "");
	}
	
	
	// 删除
	@POST
	@Path("/dalete")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result delete(User user) {
		EM.getEntityManager().remove(EM.getEntityManager().merge(user));
		EM.getEntityManager().getTransaction().commit();
		return new Result(0,"成功删除",user,"");
	}

	
	
}
