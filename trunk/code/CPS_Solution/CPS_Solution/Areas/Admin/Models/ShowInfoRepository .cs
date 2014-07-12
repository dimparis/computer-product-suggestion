using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace CPS_Solution.Areas.Admin.Models
{
    public class ShowInfo
    {
        public int NumberOfProductNoPoint { get; set; }
        public string Description { get; set; }
        public int NumberofRecordUnratedWeight { get; set; }
        public DateTime LastExecutionDate { get; set; }
        public int NumberOfStatus { get; set; }
    }
    public class ShowInfoRepository
    {
        public ShowInfo GetData()
        {
            var show = new ShowInfo();

            using (var connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(@"SELECT * FROM [dbo].[Hardware] WHERE a =0", connection))
                {
                    command.Notification = null;
                    SqlDependency dependency = new SqlDependency(command);
                    dependency.OnChange += new OnChangeEventHandler(dependency_OnChange);
                    if (connection.State == ConnectionState.Closed)
                        connection.Open();
                    using (var reader = command.ExecuteReader())
                        return reader.Cast<IDataRecord>()
                            .Select(x => new ShowInfo()
                            {
                                //JobID = x.GetInt32(0),
                                //Name = x.GetString(1),
                                //LastExecutionDate = x.GetDateTime(2),
                                NumberOfStatus = x.GetInt32(3)
                            }).FirstOrDefault();
                }
            }
        }
        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            //ShowHub.Show();
        }
    }
}