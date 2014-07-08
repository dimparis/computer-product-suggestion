using Microsoft.Owin;
using Owin;
using CPS_Solution;
[assembly: OwinStartup(typeof(CPS_Solution.Startup))]
namespace CPS_Solution
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
        }
    }
}