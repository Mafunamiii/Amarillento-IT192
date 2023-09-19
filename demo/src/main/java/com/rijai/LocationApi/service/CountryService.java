package com.rijai.LocationApi.service;

import com.rijai.LocationApi.model.Country;
import com.rijai.LocationApi.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class  CountryService implements ICountryService {
    @Autowired
    private CountryRepository repository;

    @Override
    public List<Country> findAll() {
        return (List<Country>) repository.findAll();
    }
    @Override
    public Country save(Country country) {
        return repository.save(country);
    }
    public Country addCountry(Country country) {
        return save(country);
    }

    public Country updateCountry(Country country) {
        return save(country);
    }
    @Override
    public Country getCountry(long id) {
        Optional<Country> country = repository.findById(id);
        if(country.isPresent()) {
            return country.get();
        }
        else
            return null;
    }

    public void deleteCountry(long id)
    {
        Optional<Country> country = repository.findById(id);
        if(country.isPresent()) {
            repository.delete(country.get());
        }
    }
}
