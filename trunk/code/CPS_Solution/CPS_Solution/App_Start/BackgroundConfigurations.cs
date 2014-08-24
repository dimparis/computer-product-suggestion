using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CPS_Solution.EntityFramework;
using Quartz;
using Quartz.Impl;
using CPS_Solution.CommonClass;
namespace CPS_Solution.App_Start
{
    public static class BackgroundConfigurations
    {
        private static IScheduler scheduler;

        private static ITrigger parserTrigger;

        public static void StartScheduler()
        {
            scheduler = StdSchedulerFactory.GetDefaultScheduler();
            scheduler.Start();
        }
        public static void ScheduleParser()
        {
            IJobDetail job = JobBuilder.Create<AutoParseJob>().WithIdentity("AutoParser", "Job").Build();

            ITrigger trigger = TriggerBuilder.Create().WithIdentity("ParserTrigger", "Trigger")
                .WithSchedule(CronScheduleBuilder.DailyAtHourAndMinute(1, 0))
                .Build();
            parserTrigger = trigger;

            scheduler.ScheduleJob(job, trigger);
        }
        public static void RescheduleParser(int hours, int minutes)
        {
            ITrigger trigger = TriggerBuilder.Create().WithIdentity("ParserTrigger", "Trigger")
                .WithSchedule(CronScheduleBuilder.DailyAtHourAndMinute(hours, minutes))
                .Build();
            scheduler.RescheduleJob(parserTrigger.Key, trigger);
        }

        // Update Price for all Product
        public static void ScheduleUpdatePrice()
        {
            IJobDetail job = JobBuilder.Create<AutoUpdatePrice>().WithIdentity("AutoUpdatePrice", "Job").Build();

            ITrigger trigger = TriggerBuilder.Create().WithIdentity("UpdatePriceTrigger", "Trigger")
                .WithSchedule(CronScheduleBuilder.DailyAtHourAndMinute(4, 0))
                .Build();
            parserTrigger = trigger;

            scheduler.ScheduleJob(job, trigger);
        }
        public static void RescheduleUpdatePrice(int hours, int minutes)
        {
            ITrigger trigger = TriggerBuilder.Create().WithIdentity("AutoUpdatePriceTrigger", "Trigger")
                .WithSchedule(CronScheduleBuilder.DailyAtHourAndMinute(hours, minutes))
                .Build();
            scheduler.RescheduleJob(parserTrigger.Key, trigger);
        }
        public static void ScheduleSendMail()
        {
            IJobDetail job = JobBuilder.Create<AutoSendMail>().WithIdentity("AutoSendMail", "Job").Build();

            ITrigger trigger = TriggerBuilder.Create().WithIdentity("AutoSendMailTrigger", "Trigger")
                .StartNow()
                .WithSchedule(SimpleScheduleBuilder.RepeatMinutelyForever(1))
                .Build();
            parserTrigger = trigger;

            scheduler.ScheduleJob(job, trigger);
        }
        public static void CalculateBestPoint()
        {
            IJobDetail job = JobBuilder.Create<AutoTakeBestProduct>().WithIdentity("AutoTakeBestProduct", "Job").Build();

            ITrigger trigger = TriggerBuilder.Create().WithIdentity("AutoTakeBestProductTrigger", "Trigger")
                .StartNow()
                .WithSchedule(SimpleScheduleBuilder.RepeatHourlyForever(5))
                .Build();
            parserTrigger = trigger;

            scheduler.ScheduleJob(job, trigger);
        }
        public static void CalculatePoint()
        {
            IJobDetail job = JobBuilder.Create<AutoCalculatePoint>().WithIdentity("AutoCalculatePoint", "Job").Build();
            ITrigger trigger = TriggerBuilder.Create().WithIdentity("AutoCalculatePointTrigger", "Trigger")
                .StartNow()
                .WithSchedule(SimpleScheduleBuilder.RepeatSecondlyForever(15))
                .Build();
            parserTrigger = trigger;
            scheduler.ScheduleJob(job, trigger);
        }
    }
}