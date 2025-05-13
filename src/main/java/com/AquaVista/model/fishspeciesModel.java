package com.AquaVista.model;

public class fishspeciesModel {
	private int speciesId;
    private String name;
    private String type;
    private String careLevel;
    private String temperatureRange;
    private String phRange;

    // Constructor
    public fishspeciesModel() {
    }

    // Getters and Setters
    public int getSpeciesId() {
        return speciesId;
    }

    public void setSpeciesId(int speciesId) {
        this.speciesId = speciesId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCareLevel() {
        return careLevel;
    }

    public void setCareLevel(String careLevel) {
        this.careLevel = careLevel;
    }

    public String getTemperatureRange() {
        return temperatureRange;
    }

    public void setTemperatureRange(String temperatureRange) {
        this.temperatureRange = temperatureRange;
    }

    public String getPhRange() {
        return phRange;
    }

    public void setPhRange(String phRange) {
        this.phRange = phRange;
    }
}
