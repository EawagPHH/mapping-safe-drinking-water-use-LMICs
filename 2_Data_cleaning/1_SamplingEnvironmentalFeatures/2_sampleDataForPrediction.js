
// Load the GADM data 
var level = 1;
var GADM_original = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level' + level);
var GADM = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level' + level + '_splitGeos');

// Load the composite
var composite = ee.Image("projects/crowtherlab/Composite/CrowtherLab_Composite_30ArcSec");
var bandNames = ee.List([
    'Abs_Lat',
    'CGIAR_Aridity_Index',
    'CGIAR_PET',
    'CHELSA_BIO_Annual_Mean_Temperature',
    'CHELSA_BIO_Annual_Precipitation',
    'CHELSA_BIO_Isothermality',
    'CHELSA_BIO_Max_Temperature_of_Warmest_Month',
    'CHELSA_BIO_Mean_Diurnal_Range',
    'CHELSA_BIO_Mean_Temperature_of_Coldest_Quarter',
    'CHELSA_BIO_Mean_Temperature_of_Driest_Quarter',
    'CHELSA_BIO_Mean_Temperature_of_Warmest_Quarter',
    'CHELSA_BIO_Mean_Temperature_of_Wettest_Quarter',
    'CHELSA_BIO_Min_Temperature_of_Coldest_Month',
    'CHELSA_BIO_Precipitation_Seasonality',
    'CHELSA_BIO_Precipitation_of_Coldest_Quarter',
    'CHELSA_BIO_Precipitation_of_Driest_Month',
    'CHELSA_BIO_Precipitation_of_Driest_Quarter',
    'CHELSA_BIO_Precipitation_of_Warmest_Quarter',
    'CHELSA_BIO_Precipitation_of_Wettest_Month',
    'CHELSA_BIO_Precipitation_of_Wettest_Quarter',
    'CHELSA_BIO_Temperature_Annual_Range',
    'CHELSA_BIO_Temperature_Seasonality',
    'CIFOR_TropicalPeatlandDepth',
    'CIFOR_TropicalPeatlandExtent',
    'CMS_HeterotrophicRespiration_usingEquationFromBondLamberty2004',
    'CMS_HeterotrophicRespiration_usingEquationFromSubke2006',
    'CMS_SoilRespiration_mean',
    'CSP_Global_Human_Modification',
    'ConsensusLandCoverClass_Barren',
    'ConsensusLandCoverClass_Cultivated_and_Managed_Vegetation',
    'ConsensusLandCoverClass_Deciduous_Broadleaf_Trees',
    'ConsensusLandCoverClass_Evergreen_Broadleaf_Trees',
    'ConsensusLandCoverClass_Evergreen_Deciduous_Needleleaf_Trees',
    'ConsensusLandCoverClass_Herbaceous_Vegetation',
    'ConsensusLandCoverClass_Mixed_Other_Trees',
    'ConsensusLandCoverClass_Open_Water',
    'ConsensusLandCoverClass_Regularly_Flooded_Vegetation',
    'ConsensusLandCoverClass_Shrubs',
    'ConsensusLandCoverClass_Snow_Ice',
    'ConsensusLandCoverClass_Urban_Builtup',
    'ConsensusLandCover_Human_Development_Percentage',
    'CrowtherLab_Tree_Density',
    'EarthEnvCloudCover_CloudForestPrediction',
    'EarthEnvCloudCover_Mean',
    'EarthEnvTexture_CoOfVar_EVI',
    'EarthEnvTexture_Contrast_EVI',
    'EarthEnvTexture_Correlation_EVI',
    'EarthEnvTexture_Dissimilarity_EVI',
    'EarthEnvTexture_Entropy_EVI',
    'EarthEnvTexture_Evenness_EVI',
    'EarthEnvTexture_Homogeneity_EVI',
    'EarthEnvTexture_Maximum_EVI',
    'EarthEnvTexture_Range_EVI',
    'EarthEnvTexture_Shannon_Index',
    'EarthEnvTexture_Simpson_Index',
    'EarthEnvTexture_Std_EVI',
    'EarthEnvTexture_Uniformity_EVI',
    'EarthEnvTexture_Variance_EVI',
    'EarthEnvTopoMed_1stOrderPartialDerivEW',
    'EarthEnvTopoMed_1stOrderPartialDerivNS',
    'EarthEnvTopoMed_2ndOrderPartialDerivEW',
    'EarthEnvTopoMed_2ndOrderPartialDerivNS',
    'EarthEnvTopoMed_AspectCosine',
    'EarthEnvTopoMed_AspectSine',
    'EarthEnvTopoMed_Eastness',
    'EarthEnvTopoMed_Elevation',
    'EarthEnvTopoMed_Northness',
    'EarthEnvTopoMed_ProfileCurvature',
    'EarthEnvTopoMed_Roughness',
    'EarthEnvTopoMed_Slope',
    'EarthEnvTopoMed_TangentialCurvature',
    'EarthEnvTopoMed_TerrainRuggednessIndex',
    'EarthEnvTopoMed_TopoPositionIndex',
    'EarthEnvTopoMed_VectorRuggednessMeasure',
    'EsaCci_BurntAreasProbability',
    'FanEtAl_Depth_to_Water_Table_AnnualMean',
    'FanEtAl_Depth_to_Water_Table_AnnualSD',
    'GHS_Population_Density',
    'GPWv4_Population_Density',
    'GiriEtAl_MangrovesExtent',
    'GLW3_RuminantsDistribution_downsampled10km',
    'GoshEtAl_GlobalGDP2006',
    'IPCC_Global_Biomass',
    'MODIS_EVI',
    'MODIS_FPAR',
    'MODIS_GPP',
    'MODIS_LAI',
    'MODIS_NDVI',
    'MODIS_NPP',
    'MODIS_Nadir_Reflectance_Band1',
    'MODIS_Nadir_Reflectance_Band2',
    'MODIS_Nadir_Reflectance_Band3',
    'MODIS_Nadir_Reflectance_Band4',
    'MODIS_Nadir_Reflectance_Band5',
    'MODIS_Nadir_Reflectance_Band6',
    'MODIS_Nadir_Reflectance_Band7',
    'NASA_ForestCanopyHeight',
    'PelletierEtAl_SoilAndSedimentaryDepositThicknesses',
    'SG_Absolute_depth_to_bedrock',
    'SG_Bulk_density_015cm',
    'SG_CEC_015cm',
    'SG_Clay_Content_015cm',
    'SG_Coarse_fragments_015cm',
    'SG_Depth_to_bedrock',
    'SG_H2O_Capacity_015cm',
    'SG_SOC_Content_015cm',
    'SG_SOC_Density_015cm',
    'SG_SOC_Stock_005cm_to_015cm',
    'SG_Saturated_H2O_Content_015cm',
    'SG_Silt_Content_015cm',
    'SG_Soil_H2O_Capacity_pF_20_015cm',
    'SG_Soil_pH_H2O_015cm',
    'SpawnEtAl_HarmonizedAGBiomass',
    'SpawnEtAl_HarmonizedBGBiomass',
    'TootchiEtAl_WetlandsRegularlyFlooded',
    'UNEP_WCMC_Biomass',
    'WCS_Human_Footprint_2009']);

var modeBandNames = ee.List(['WWF_Biome','WWF_Ecoregion','Resolve_Biome','Resolve_Ecoregion']);

// Map over the GADM data, gather the administration keys
var listOfAdminUnits = GADM.aggregate_array('GID_' + level).distinct().sort();

// Agreggate the area sizes
var GADM_prep = GADM.map(function(f){return ee.Feature(f).set('area',ee.Feature(f).area())});

// Compute the total area sizes of the admin units and create dictionary
var totalAreasOfAdminUnits = listOfAdminUnits.map(function(u){return GADM_prep.filterMetadata('GID_' + level,'equals',u).aggregate_sum('area')});
var dictOftotalAreasOfAdminUnits = ee.Dictionary.fromLists(listOfAdminUnits, totalAreasOfAdminUnits);

// Add the total area sizes to the admin units 
var GADM_prep = GADM_prep.map(function(f){
  var feature = ee.Feature(f).set('totalAreaOfAdminUnit',dictOftotalAreasOfAdminUnits.get(ee.Feature(f).get('GID_' + level)));
  return feature.set('areaFraction',ee.Number(feature.get('area')).divide(feature.get('totalAreaOfAdminUnit')))});

// Sample the bands of interest and scale the mean value by the area fraction 
var GADM_prep = GADM_prep.map(function(f){
  var poly = f.geometry();
  var areaFraction = f.get('areaFraction');
  // Get the mean values 
  var dict = composite.select(bandNames.sort()).reduceRegion({
                    reducer: ee.Reducer.mean(),
                    crs: composite.projection().getInfo().crs,
                    crsTransform: composite.projection().getInfo().transform,
                    geometry: poly,
                    maxPixels: 1e13,
                    tileScale: 16});
  var dictSum = ee.ImageCollection("CIESIN/GPWv411/GPW_UNWPP-Adjusted_Population_Count").filterDate('2015','2021').toBands().rename(['GPWv4_Population_2015','GPWv4_Population_2020']).reduceRegion({
                    reducer: ee.Reducer.sum(),
                    crs: composite.projection().getInfo().crs,
                    crsTransform: composite.projection().getInfo().transform,
                    geometry: poly,
                    maxPixels: 1e13,
                    tileScale: 16});
  var dictMode_prep = composite.select(modeBandNames.sort()).reduceRegion({
                    reducer: ee.Reducer.frequencyHistogram(),
                    crs: composite.projection().getInfo().crs,
                    crsTransform: composite.projection().getInfo().transform,
                    geometry: poly,
                    maxPixels: 1e13,
                    tileScale: 16});
  var dictModeKeys = dictMode_prep.keys();
  var dictModeValues = dictMode_prep.values().map(function(v){return ee.String.encodeJSON(v)});
  var dictMode = ee.Dictionary.fromLists(dictModeKeys,dictModeValues);
  return f.set(dict)
          .set(dictSum)
          .set(dictMode)});
  
// Export this intermediate result 
Export.table.toAsset(GADM_prep,'GADM36_level' + level + '_prep','projects/crowtherlab/t3/WaterQualityInDevC/GADM36_level' + level + '_prep');
Export.table.toDrive(GADM_prep,'GADM36_level' + level + '_prep_toDrive');
Export.table.toDrive(GADM_original.select(['NAME_0','NAME_1']),'GADM36_level' + level + '_geos_toDrive');
