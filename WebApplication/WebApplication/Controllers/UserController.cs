using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
namespace FirstProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private static List<string> listUser = new List<string>() { "Bob", "Bil ", "Ronaldo" };

        [HttpGet]
        public List<string> GetUsers()
        {
            return listUser;
        }

        [HttpGet("{id}")]
        public string GetUser(int id)
        {
            if (id >= 0 && id < listUser.Count)
            {
                return listUser[id];
            }
            return "";
        }

        [HttpPost]
        public void AddUser(string user)
        {
            listUser.Add(user);
        }

        [HttpPut("{id}")]
        public void UpdateUser(int id , string user)
        {
            if (id >= 0 && id < listUser.Count)
            {
                listUser[id] = user;
            }
            
        }

        [HttpDelete("{id}")]
        public void DeleteUser(int id)
        {
            if (id >= 0 && id < listUser.Count)
            {
                listUser.RemoveAt(id);
            }
        }

    }
}
