package com.yc.wap.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Nozomi on 11/12/2016.
 */
@Controller
@RequestMapping(value = "common")
public class CommonController {

    @RequestMapping(value = "aboutus")
    public String aboutus() {
        return "common/aboutus";
    }

    @RequestMapping(value = "recruit")
    public String recruit() {
        return "common/recruit";
    }
}