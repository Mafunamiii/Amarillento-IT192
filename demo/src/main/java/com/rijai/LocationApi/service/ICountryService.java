package com.rijai.LocationApi.service;

import com.rijai.LocationApi.model.Country;
import org.springframework.ui.Model;

import java.util.List;

public interface ICountryService {
    List<Country> findAll();
    Country save(Country country);

    void deleteCountry(long id);
    Country updateCountry(Country newCountry);

    Country getCountry(long id);

}