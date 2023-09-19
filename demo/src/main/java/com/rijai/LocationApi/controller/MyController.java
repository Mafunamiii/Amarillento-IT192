package com.rijai.LocationApi.controller;

import com.rijai.LocationApi.model.Country;
import com.rijai.LocationApi.service.ICountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MyController {
    @Autowired
    private ICountryService countryService;

    @GetMapping("/countries")
    public String findCountries(Model model){
        var countries= (List<Country>) countryService.findAll();
        model.addAttribute("countries",countries);
        return "showCountries";
    }

    @GetMapping("/getcountry/{id}")
    @ResponseBody
    public ResponseEntity<Country> getCountry(@PathVariable long id) {
        Country country = countryService.getCountry(id);
        if (country != null) {
            return ResponseEntity.ok(country);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/addcountry")
    public String add(Country newCountry, Model model){
        model.addAttribute("newCountry", newCountry);
        countryService.save(newCountry);
        return "redirect:/countries";
    }

    @PostMapping("/deletecountry/{id}")
    public String delete(@PathVariable long id){
        countryService.deleteCountry(id);
        return "redirect:/countries";
    }
    @PostMapping("/updatecountry")
    public String update(Country newCountry){
        countryService.updateCountry(newCountry);
        return "redirect:/countries";
    }

}
