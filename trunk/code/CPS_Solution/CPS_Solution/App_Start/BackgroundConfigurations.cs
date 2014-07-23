﻿using System;
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
                .WithSchedule(CronScheduleBuilder.DailyAtHourAndMinute(1, 0))
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
    }
}