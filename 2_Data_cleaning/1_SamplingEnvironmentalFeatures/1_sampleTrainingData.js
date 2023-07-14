// Define island groups for Kiribati
var noGil = 
    ee.Geometry.Polygon(
        [[[173.76214858993802, 1.688437284048748],
          [173.89398452743802, 3.2689380495714633],
          [172.53167983993802, 4.277476168442425],
          [172.05246629783107, 3.029716351603881],
          [172.84548591405644, 1.4656846206052414],
          [173.12175664737128, 1.3820186787491144],
          [173.1354466421833, 1.3865663776048271],
          [173.14021024539375, 1.3954043333854713]]]),
    souTara = 
    ee.Geometry.Polygon(
        [[[173.14024407183683, 1.3954382342837202],
          [173.13552338397062, 1.3865573758520389],
          [173.12591034686125, 1.382867734037598],
          [172.9929535267801, 1.3664672516799288],
          [172.8940765736551, 1.3946115454160364],
          [172.8940765736551, 1.317042332174653],
          [173.04582523088166, 1.304685947700206],
          [173.21679996232697, 1.3609756435068756],
          [173.17560123185822, 1.406967470897869]]]),
    cenGil = 
    ee.Geometry.Polygon(
        [[[172.75257236267254, 1.106559466163889],
          [172.75257236267254, -0.947771870448704],
          [174.70813876892254, -0.947771870448704],
          [174.70813876892254, 1.106559466163889]]], null, false),
    souGil = 
    ee.Geometry.Polygon(
        [[[174.44446689392254, -1.0356493216635867],
          [174.44446689392254, -2.858249945133194],
          [177.15808994079754, -2.858249945133194],
          [177.15808994079754, -1.0356493216635867]]], null, false),
    lineAndPhoenix = 
    ee.Geometry.Polygon(
        [[[178.7565749612447, 8.140225397293124],
          [178.7565749612447, -20.88502241263751],
          [223.75657496124472, -20.88502241263751],
          [223.75657496124472, 8.140225397293124]]], null, false);

// Define the countries to sample from level 0, 2, 3 or 1
var countryLevel0 = ['Kiribati','Tonga'];
var countryLevel2 = ['Bangladesh','Kosovo','Madagascar','Palestina','Togo', 'Gambia', 'Iraq', 'São Tomé and Príncipe'];
var countryLevel3 = 'Pakistan';

// Load the GADM datasets 
var GADM_level0 = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level0')
                    .filter(ee.Filter.inList('NAME_0',['Kiribati']));

var GADM_level1_prep = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level1');

var GADM_level2_prep = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level2');
var GADM_level2 = GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[0])
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[1]))
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[2]))
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[3]))  
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[4]))
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[5]))  
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[6]))  
                  .merge(GADM_level2_prep
                    .filterMetadata('NAME_0','equals',countryLevel2[7]));
                    
var GADM_level3 = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level3')
                    .filterMetadata('NAME_0','equals',countryLevel3);

// Define Kiribati 
var NORTHERN_GILBERT = ee.Feature(GADM_level0.geometry().intersection(noGil, 10)).set('NAME_1','NORTHERN GILBERT').set('NAME_0','Kiribati');
var SOUTH_TARAWA = ee.Feature(GADM_level0.geometry().intersection(souTara, 10)).set('NAME_1','SOUTH TARAWA').set('NAME_0','Kiribati');
var CENTRAL_GILBERT = ee.Feature(GADM_level0.geometry().intersection(cenGil, 10)).set('NAME_1','CENTRAL GILBERT').set('NAME_0','Kiribati');
var SOUTHERN_GILBERT = ee.Feature(GADM_level0.geometry().intersection(souGil, 10)).set('NAME_1','SOUTHERN GILBERT').set('NAME_0','Kiribati');
var LINE_AND_PHOENIX = ee.Feature(GADM_level0.geometry().intersection(lineAndPhoenix, 10)).set('NAME_1','LINE AND PHOENIX GROUP').set('NAME_0','Kiribati');
var GADM_level0 = ee.FeatureCollection([NORTHERN_GILBERT, SOUTH_TARAWA, CENTRAL_GILBERT, SOUTHERN_GILBERT, LINE_AND_PHOENIX]);

///// Define the new regions for Level 1
// Algeria 
var NORD_CENTRE = ['Alger','Blida','Boumerdès','Tipaza','Bouira','Médéa','Tizi Ouzou','Béjaïa','Chlef','Aïn Defla'];
var NORD_EST = ['Annaba','Constantine','Skikda','Jijel','Mila','Souk Ahras','El Tarf','Guelma'];
var NORD_OUEST = ['Oran','Tlemcen','Mostaganem','Aïn Témouchent','Relizane','Sidi Bel Abbès','Mascara'];
var HAUT_PLATEAU_CENTRE = ['Djelfa','Laghouat',"M'Sila"];
var HAUT_PLATEAU_EST = ['Sétif','Batna','Khenchela','Bordj Bou Arréridj','Oum el Bouaghi','Tébessa'];
var HAUT_PLATEAU_OUEST = ['Saïda','Tissemsilt','Naâma','El Bayadh','Tiaret'];
var SUD = ['Béchar','Tindouf','Adrar','Ghardaïa','Biskra','El Oued','Ouargla','Tamanghasset','Illizi'];

// Central African Republic 
var REGION_1 = ["Ombella-M'Poko","Lobaye"];
var REGION_2 = ["Mambéré-Kadéï","Nana-Mambéré","Sangha-Mbaéré"];
var REGION_3 = ["Ouham-Pendé","Ouham"];
var REGION_4 = ["Kémo","Nana-Grébizi","Ouaka"];
var REGION_5 = ["Bamingui-Bangoran","Haute-Kotto","Vakaga"];
var REGION_6 = ["Basse-Kotto","Mbomou","Haut-Mbomou"];
var REGION_7 = ["Bangui"];

// Mongolia
var WESTERN = ["Bayan-Ölgiy","Govi-Altay","Dzavhan","Hovd","Uvs"];
var EASTERN = ["Dornod","Sühbaatar","Hentiy"];
var ULAANBAATAR = ["Ulaanbaatar"];
var CENTRAL = ["Töv","Ömnögovi","Selenge","Orhon","Darhan-Uul","Govisümber","Dundgovi","Dornogovi"];
var KHANGAI = ["Bayanhongor","Hövsgöl","Arhangay","Övörhangay","Bulgan"];

// Tunisia
var TUNISIA_District_Tunis = ["Ariana","Ben Arous (Tunis Sud)","Bizerte","Manubah","Nabeul","Tunis","Zaghouan"];
var TUNISIA_NORD_OUEST = ["Béja","Jendouba","Le Kef","Siliana"];
var TUNISIA_CENTRE_EST = ["Mahdia","Monastir","Sousse"];
var TUNISIA_CENTRE_OUEST = ["Kairouan","Kassérine","Sidi Bou Zid"];
var TUNISIA_SUD_EST = ["Gabès","Médenine","Sfax","Tataouine"];
var TUNISIA_SUD_OUEST = ["Gafsa","Kebili","Tozeur"];

// Concatenate the districts into regions
var NORD_CENTRE = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",NORD_CENTRE));
var NORD_EST = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",NORD_EST));
var NORD_OUEST = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",NORD_OUEST));
var HAUT_PLATEAU_CENTRE = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",HAUT_PLATEAU_CENTRE));
var HAUT_PLATEAU_EST = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",HAUT_PLATEAU_EST));
var HAUT_PLATEAU_OUEST = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",HAUT_PLATEAU_OUEST));
var SUD = GADM_level1_prep.filterMetadata('NAME_0','equals','Algeria').filter(ee.Filter.inList("NAME_1",SUD));

var REGION_1 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_1));
var REGION_2 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_2));
var REGION_3 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_3));
var REGION_4 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_4));
var REGION_5 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_5));
var REGION_6 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_6));
var REGION_7 = GADM_level1_prep.filterMetadata('NAME_0','equals','Central African Republic').filter(ee.Filter.inList("NAME_1",REGION_7));   

var WESTERN = GADM_level1_prep.filterMetadata('NAME_0','equals','Mongolia').filter(ee.Filter.inList("NAME_1",WESTERN));
var EASTERN = GADM_level1_prep.filterMetadata('NAME_0','equals','Mongolia').filter(ee.Filter.inList("NAME_1",EASTERN));
var ULAANBAATAR = GADM_level1_prep.filterMetadata('NAME_0','equals','Mongolia').filter(ee.Filter.inList("NAME_1",ULAANBAATAR));
var CENTRAL = GADM_level1_prep.filterMetadata('NAME_0','equals','Mongolia').filter(ee.Filter.inList("NAME_1",CENTRAL));
var KHANGAI = GADM_level1_prep.filterMetadata('NAME_0','equals','Mongolia').filter(ee.Filter.inList("NAME_1",KHANGAI));
           
var TUNISIA_District_Tunis = GADM_level1_prep.filterMetadata('NAME_0','equals','Tunisia').filter(ee.Filter.inList("NAME_1",TUNISIA_District_Tunis));
var TUNISIA_NORD_OUEST = GADM_level1_prep.filterMetadata('NAME_0','equals','Tunisia').filter(ee.Filter.inList("NAME_1",TUNISIA_NORD_OUEST));
var TUNISIA_CENTRE_EST = GADM_level1_prep.filterMetadata('NAME_0','equals','Tunisia').filter(ee.Filter.inList("NAME_1",TUNISIA_CENTRE_EST));
var TUNISIA_CENTRE_OUEST = GADM_level1_prep.filterMetadata('NAME_0','equals','Tunisia').filter(ee.Filter.inList("NAME_1",TUNISIA_CENTRE_OUEST));
var TUNISIA_SUD_EST = GADM_level1_prep.filterMetadata('NAME_0','equals','Tunisia').filter(ee.Filter.inList("NAME_1",TUNISIA_SUD_EST));
var TUNISIA_SUD_OUEST = GADM_level1_prep.filterMetadata('NAME_0','equals','Tunisia').filter(ee.Filter.inList("NAME_1",TUNISIA_SUD_OUEST));           
                          
// Final FCs
var Algeria = ee.FeatureCollection([
    ee.Feature(NORD_CENTRE.union().geometry()).set('NAME_0','Algeria').set('NAME_1','NORD CENTRE').set('NAME_1s',NORD_CENTRE.aggregate_array('NAME_1').join('|')).set('GID_1s',NORD_CENTRE.aggregate_array('GID_1').join('|')),
    ee.Feature(NORD_EST.union().geometry()).set('NAME_0','Algeria').set('NAME_1','NORD EST').set('NAME_1s',NORD_EST.aggregate_array('NAME_1').join('|')).set('GID_1s',NORD_EST.aggregate_array('GID_1').join('|')),
    ee.Feature(NORD_OUEST.union().geometry()).set('NAME_0','Algeria').set('NAME_1','NORD OUEST').set('NAME_1s',NORD_OUEST.aggregate_array('NAME_1').join('|')).set('GID_1s',NORD_OUEST.aggregate_array('GID_1').join('|')),
    ee.Feature(HAUT_PLATEAU_CENTRE.union().geometry()).set('NAME_0','Algeria').set('NAME_1','HAUT PLATEAU CENTRE').set('NAME_1s',HAUT_PLATEAU_CENTRE.aggregate_array('NAME_1').join('|')).set('GID_1s',HAUT_PLATEAU_CENTRE.aggregate_array('GID_1').join('|')),
    ee.Feature(HAUT_PLATEAU_EST.union().geometry()).set('NAME_0','Algeria').set('NAME_1','HAUT PLATEAU EST').set('NAME_1s',HAUT_PLATEAU_EST.aggregate_array('NAME_1').join('|')).set('GID_1s',HAUT_PLATEAU_EST.aggregate_array('GID_1').join('|')),                                                    
    ee.Feature(HAUT_PLATEAU_OUEST.union().geometry()).set('NAME_0','Algeria').set('NAME_1','HAUT PLATEAU OUEST').set('NAME_1s',HAUT_PLATEAU_OUEST.aggregate_array('NAME_1').join('|')).set('GID_1s',HAUT_PLATEAU_OUEST.aggregate_array('GID_1').join('|')),                                                        
    ee.Feature(SUD.union().geometry()).set('NAME_0','Algeria').set('NAME_1','SUD').set('NAME_1s',SUD.aggregate_array('NAME_1').join('|')).set('GID_1s',SUD.aggregate_array('GID_1').join('|'))
    ]);
var CAR = ee.FeatureCollection([
    ee.Feature(REGION_1.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_1').set('NAME_1s',REGION_1.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_1.aggregate_array('GID_1').join('|')),
    ee.Feature(REGION_2.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_2').set('NAME_1s',REGION_2.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_2.aggregate_array('GID_1').join('|')),
    ee.Feature(REGION_3.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_3').set('NAME_1s',REGION_3.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_3.aggregate_array('GID_1').join('|')),
    ee.Feature(REGION_4.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_4').set('NAME_1s',REGION_4.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_4.aggregate_array('GID_1').join('|')),
    ee.Feature(REGION_5.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_5').set('NAME_1s',REGION_5.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_5.aggregate_array('GID_1').join('|')),                                                    
    ee.Feature(REGION_6.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_6').set('NAME_1s',REGION_6.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_6.aggregate_array('GID_1').join('|')),                                                        
    ee.Feature(REGION_7.union().geometry()).set('NAME_0','Central African Republic').set('NAME_1','REGION_7').set('NAME_1s',REGION_7.aggregate_array('NAME_1').join('|')).set('GID_1s',REGION_7.aggregate_array('GID_1').join('|'))
    ]);
var Mongolia = ee.FeatureCollection([
    ee.Feature(WESTERN.union().geometry()).set('NAME_0','Mongolia').set('NAME_1','WESTERN').set('NAME_1s',WESTERN.aggregate_array('NAME_1').join('|')).set('GID_1s',WESTERN.aggregate_array('GID_1').join('|')),
    ee.Feature(EASTERN.union().geometry()).set('NAME_0','Mongolia').set('NAME_1','EASTERN').set('NAME_1s',EASTERN.aggregate_array('NAME_1').join('|')).set('GID_1s',EASTERN.aggregate_array('GID_1').join('|')),
    ee.Feature(ULAANBAATAR.union().geometry()).set('NAME_0','Mongolia').set('NAME_1','ULAANBAATAR').set('NAME_1s',ULAANBAATAR.aggregate_array('NAME_1').join('|')).set('GID_1s',ULAANBAATAR.aggregate_array('GID_1').join('|')),
    ee.Feature(CENTRAL.union().geometry()).set('NAME_0','Mongolia').set('NAME_1','CENTRAL').set('NAME_1s',CENTRAL.aggregate_array('NAME_1').join('|')).set('GID_1s',CENTRAL.aggregate_array('GID_1').join('|')),                                                    
    ee.Feature(KHANGAI.union().geometry()).set('NAME_0','Mongolia').set('NAME_1','KHANGAI').set('NAME_1s',KHANGAI.aggregate_array('NAME_1').join('|')).set('GID_1s',KHANGAI.aggregate_array('GID_1').join('|'))
    ]);
var Tunisia = ee.FeatureCollection([
    ee.Feature(TUNISIA_District_Tunis.union().geometry()).set('NAME_0','Tunisia').set('NAME_1','TUNISIA_District_Tunis').set('NAME_1s',TUNISIA_District_Tunis.aggregate_array('NAME_1').join('|')).set('GID_1s',TUNISIA_District_Tunis.aggregate_array('GID_1').join('|')),
    ee.Feature(TUNISIA_NORD_OUEST.union().geometry()).set('NAME_0','Tunisia').set('NAME_1','TUNISIA_NORD_OUEST').set('NAME_1s',TUNISIA_NORD_OUEST.aggregate_array('NAME_1').join('|')).set('GID_1s',TUNISIA_NORD_OUEST.aggregate_array('GID_1').join('|')),
    ee.Feature(TUNISIA_CENTRE_EST.union().geometry()).set('NAME_0','Tunisia').set('NAME_1','TUNISIA_CENTRE_EST').set('NAME_1s',TUNISIA_CENTRE_EST.aggregate_array('NAME_1').join('|')).set('GID_1s',TUNISIA_CENTRE_EST.aggregate_array('GID_1').join('|')),
    ee.Feature(TUNISIA_CENTRE_OUEST.union().geometry()).set('NAME_0','Tunisia').set('NAME_1','TUNISIA_CENTRE_OUEST').set('NAME_1s',TUNISIA_CENTRE_OUEST.aggregate_array('NAME_1').join('|')).set('GID_1s',TUNISIA_CENTRE_OUEST.aggregate_array('GID_1').join('|')),
    ee.Feature(TUNISIA_SUD_EST.union().geometry()).set('NAME_0','Tunisia').set('NAME_1','TUNISIA_SUD_EST').set('NAME_1s',TUNISIA_SUD_EST.aggregate_array('NAME_1').join('|')).set('GID_1s',TUNISIA_SUD_EST.aggregate_array('GID_1').join('|')),                                                    
    ee.Feature(TUNISIA_SUD_OUEST.union().geometry()).set('NAME_0','Tunisia').set('NAME_1','TUNISIA_SUD_OUEST').set('NAME_1s',TUNISIA_SUD_OUEST.aggregate_array('NAME_1').join('|')).set('GID_1s',TUNISIA_SUD_OUEST.aggregate_array('GID_1').join('|'))
    ]);    
var GADM_level1 = Algeria.merge(CAR).merge(Tunisia).merge(Mongolia);

// Add the missing properties 
var GADM_level3 = GADM_level3.map(function(f){return f.set('NAME_1s', 'NaN').set('GID_1s', 'NaN')});
var GADM_level0 = GADM_level0.map(function(f){var p = GADM_level3.first().propertyNames().removeAll(GADM_level0.first().propertyNames()); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});
var GADM_level2 = GADM_level2.map(function(f){var p = GADM_level3.first().propertyNames().removeAll(GADM_level2.first().propertyNames()); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});
var GADM_level1 = GADM_level1.map(function(f){var p = GADM_level3.first().propertyNames().removeAll(GADM_level1.first().propertyNames()); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});                                              
// Merge the data 
var GADM_toSample = GADM_level2.merge(GADM_level0).merge(GADM_level3).merge(GADM_level1);

///// Define the new regions for Level 3
var Pakistan_Gujranwala = ee.FeatureCollection(ee.Feature(GADM_toSample.filterMetadata('NAME_3','contains','Gujranwala').geometry())
                              .set('NAME_3','Gujranwala'))
                              .map(function(f){var p = GADM_level3.first().propertyNames().removeAll(['NAME_3']); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});                  
var REGIAO_NORTE_OESTE = ee.FeatureCollection(ee.Feature(GADM_toSample.filterMetadata('NAME_0','contains','São Tomé and Príncipe')
                            .filter(ee.Filter.inList('NAME_2',['Lembá','Lobata'])).geometry())
                            .set('NAME_2','REGIÃO NORTE OESTE'))
                            .map(function(f){var p = GADM_level3.first().propertyNames().removeAll(['NAME_2']); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});                  
var REGIAO_SUL_ESTE = ee.FeatureCollection(ee.Feature(GADM_toSample.filterMetadata('NAME_0','contains','São Tomé and Príncipe')
                            .filter(ee.Filter.inList('NAME_2',['Cantagalo','Caué'])).geometry())
                            .set('NAME_2','REGIÃO SUL ESTE'))
                            .map(function(f){var p = GADM_level3.first().propertyNames().removeAll(['NAME_2']); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});                  
// Add them to the to sampling data 
var GADM_toSample = GADM_toSample.merge(Pakistan_Gujranwala).merge(REGIAO_NORTE_OESTE).merge(REGIAO_SUL_ESTE);

// Add the data to the map 
Map.addLayer(GADM_toSample,{},'GADM to sample');

// Define a function to gather the values 
function getValues(feature, reducer, composite){
  var f = ee.Feature(feature);
  var poly = f.geometry();
  var dict = composite.reduceRegion({
                    reducer: reducer,
                    crs: composite.projection().getInfo().crs,
                    crsTransform: composite.projection().getInfo().transform,
                    geometry: poly,
                    maxPixels: 1e13,
                    tileScale: 16});
  return f.set(dict);
}

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

// Sample the composite 
var GADM_sampled_prep = GADM_toSample.map(function(feature){return getValues(feature, ee.Reducer.mode(), composite.select(modeBandNames))});
var GADM_sampled = GADM_sampled_prep.map(function(feature){return getValues(feature, ee.Reducer.mean(), composite.select(bandNames))});

// Map.addLayer(composite)
// Export the training data 
// Export.table.toAsset(GADM_sampled,'GADM36_trainingData','projects/restor_internal/GADM36_trainingData');

// Import the processed data 
// var GADM_sampled_loaded = ee.FeatureCollection('projects/restor_internal/GADM36_trainingData');
Export.table.toDrive(GADM_sampled,'GADM36_trainingData_toDrive');


// Get data for Level 0 countries
var GADM_level0 = ee.FeatureCollection('users/crowtherlab/GADM36/GADM36_level0')
                    .filter(ee.Filter.inList('NAME_0',countryLevel0));
var GADM_level0_toSample = GADM_level0.map(function(f){var p = GADM_level3.first().propertyNames().removeAll(GADM_level0.first().propertyNames()); 
                                              return f.set(ee.Dictionary.fromLists(p,ee.List.repeat('NaN',p.size())))});

// Sample the composite 
var GADM_sampled_prep = GADM_level0_toSample.map(function(feature){return getValues(feature, ee.Reducer.mode(), composite.select(modeBandNames))});
var GADM_sampled = GADM_sampled_prep.map(function(feature){return getValues(feature, ee.Reducer.mean(), composite.select(bandNames))});
Export.table.toDrive(GADM_sampled,'GADM36_trainingData_level0_toDrive');

