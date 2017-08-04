package com.holidays.controllers;

import com.holidays.service.HolidayService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.Serializable;
import java.util.Calendar;
import java.util.GregorianCalendar;

@Controller
public class CalculateController {

    private HolidayService holidayService;

    public CalculateController(HolidayService holidayService) {
        this.holidayService = holidayService;
    }

    @RequestMapping(value = "/calculate", method = RequestMethod.GET)
    public String calculatePage() {

        return "calculate";
    }

    @RequestMapping(value = "/calculate", method = RequestMethod.POST)
    public ModelAndView getResult(@RequestParam String startDate, @RequestParam String endDate) {

        ModelAndView modelAndView = new ModelAndView("calculate");
        Result result = getWeekend(startDate, endDate);

        modelAndView.addObject("result", result);
        return modelAndView;

    }

    private Result getWeekend(String startDate, String endDate) {
        String[] start = startDate.split("-");
        String[] end = endDate.split("-");
        GregorianCalendar calStart = new GregorianCalendar(Integer.parseInt(start[0]), Integer.parseInt(start[1]), Integer.parseInt(start[2]));
        GregorianCalendar calEnd = new GregorianCalendar(Integer.parseInt(end[0]), Integer.parseInt(end[1]), Integer.parseInt(end[2]));

        int holidays = holidayService.getHolidaysBeetweenDates(startDate, endDate);
        Result result = new Result();
        result.setHolidays(holidays);

        int weekdays = holidays;

        while (calStart.before(calEnd)) {

            int sunday = 6;
            int saturday = 7;
            if (sunday == (calStart.get(Calendar.DAY_OF_WEEK)) ||
                    saturday == (calStart.get(Calendar.DAY_OF_WEEK))) {
                weekdays++;
            }

            calStart.set(Calendar.HOUR_OF_DAY, 24);
        }
        result.setWeekdays(weekdays);
        return result;
    }

    public class Result implements Serializable {

        int weekdays;
        int holidays;

        public int getWeekdays() {
            return weekdays;
        }

        public void setWeekdays(int weekdays) {
            this.weekdays = weekdays;
        }

        public int getHolidays() {
            return holidays;
        }

        public void setHolidays(int holidays) {
            this.holidays = holidays;
        }

        @Override
        public String toString() {
            return "Result{" +
                    "weekdays=" + weekdays +
                    ", holidays=" + holidays +
                    '}';
        }
    }
}
