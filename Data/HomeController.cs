using Microsoft.AspNetCore.Mvc;

namespace Karisbrook.Data
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
