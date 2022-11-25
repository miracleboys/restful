package restful.api;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import restful.bean.Result;
import restful.database.EM;
import restful.entity.User;

@Path("user")
public class UserAPI {
	
	@POST
	@Path("/signUp")
	@Consumes("application/json;charset=UTF-8")
	@Produces("application/json;charset=UTF-8")
	public Result signUp(User user) {
		user.setId(0);
		user = EM.getEntityManager().merge(user);
		EM.getEntityManager().persist(user);
		EM.getEntityManager().getTransaction().commit();
		return new Result(0, "添加成功", user, "");
	}
	
	
}
