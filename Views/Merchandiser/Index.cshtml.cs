using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Karisbrook.Views.Merchandiser
  

{
    [Authorize(Roles = "Merchandiser")]
    public class IndexModel : PageModel
    {
        
        public void OnGet()
        {
        }
    }
}
