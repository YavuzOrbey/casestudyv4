package com.casestudydraft.webcontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Calendar;
import java.util.Locale;

@Controller
public class UserController {

    @RequestMapping(value="/dashboard", method= RequestMethod.GET)
    public ModelAndView showDashboard(HttpServletRequest request) {
        ModelAndView mav = null;

        //get current month
//		Calendar theCalendar = new GregorianCalendar();
//		theCalendar.setTime(new Date());
        LocalDate firstDayOfMonth = LocalDate.now().withDayOfMonth(1);
        DayOfWeek firstDay = firstDayOfMonth.getDayOfWeek();

        Calendar calendar = Calendar.getInstance();
        int lastDayNum = calendar.getActualMaximum(Calendar.DATE);

        LocalDate lastDayOfMonth = LocalDate.now().withDayOfMonth(lastDayNum);
        DayOfWeek lastDay = lastDayOfMonth.getDayOfWeek();


        int numWeeks = calendar.getActualMaximum(Calendar.WEEK_OF_MONTH);
        mav = new ModelAndView("pages/dashboard");

//		Map<Integer, DayOfWeek> theMonth = new HashMap<Integer, DayOfWeek>();
//		for(int i=1; i<= firstDayOfMonth.lengthOfMonth(); i++) {
//			theMonth.put(i, firstDayOfMonth.plusDays(i-1).getDayOfWeek());
//		}

        String[] daysOfWeek = new String[DayOfWeek.values().length];
        for(int i=0; i<  DayOfWeek.values().length; i++){
            daysOfWeek[i] = DayOfWeek.values()[i].getDisplayName(TextStyle.FULL, Locale.US);
        }

        mav.addObject("month_name", firstDayOfMonth.getMonth().name());
        mav.addObject("daysOfWeek", daysOfWeek);
        mav.addObject("numWeeks", numWeeks);
        mav.addObject("firstDay", firstDay.getValue()+1);
        mav.addObject("lastDay", lastDay.getValue()+1);
        return mav;
    }
}
