package com.lilac.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping(value = "/update-event", produces = "text/plain;charset=UTF-8")
public class EventController {
    // this is to emulate a system new day event caller. Whatever it can invoke properly in this work.
    // As regular, this event called a new day, and every call will let server check all domains and
    // run an Expired-Domain removing procedure.
    // for this classwork, we won't make it complete.
    // and its' invoke has various methods. for example, write a script to run with server OS task plans
    // which only need a localhost access.
    @PostMapping("/refresh-day-schedule")
    public void NewDayProcedure(@RequestHeader HttpHeaders header, @RequestBody String body){
        Date date = new Date();
        // if possible, check if the date mixed
        if(header.getHost().toString().contains("localhost")) {/*...*/}
        else return;
    }

    // here should invoke everything necessary for a new day:
    // - remove expired by using procedure,
    // - renew domains with # in 30-day warning range
    // - and more......
}
