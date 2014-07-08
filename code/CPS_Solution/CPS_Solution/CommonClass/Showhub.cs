using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNet.SignalR;
namespace CPS_Solution.CommonClass
{
    public class Showhub:Hub
    {
        public static void Show()
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<Showhub>();
            context.Clients.All.displayStatus();
        }
    }
}