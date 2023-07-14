import pandas as pd
import numpy as np
import json

##############################################################################################################################
##############################################################################################################################
### DATA AGGREGATION

sampled_data = pd.read_csv('../data/GADM36_level1_prep_toDrive.csv', dtype=object, encoding='latin', index_col='system:index')
sampled_data = sampled_data.drop(columns='.geo')
training_data = pd.read_csv('../data/GADM36_trainingData_toDrive.csv', dtype=object, encoding='latin', index_col='system:index')
training_data = training_data.drop(columns='.geo')

# Get the unique admin unit ids
adminUnits = sorted(list(set(sampled_data['GID_1'])))

# Define the parameters that give the mean or the mode over an administrative unit
modeParameters = ['WWF_Biome','WWF_Ecoregion','Resolve_Biome','Resolve_Ecoregion']
meanParameters = ['Abs_Lat','CGIAR_Aridity_Index','CGIAR_PET','CHELSA_BIO_Annual_Mean_Temperature','CHELSA_BIO_Annual_Precipitation','CHELSA_BIO_Isothermality','CHELSA_BIO_Max_Temperature_of_Warmest_Month','CHELSA_BIO_Mean_Diurnal_Range','CHELSA_BIO_Mean_Temperature_of_Coldest_Quarter','CHELSA_BIO_Mean_Temperature_of_Driest_Quarter','CHELSA_BIO_Mean_Temperature_of_Warmest_Quarter','CHELSA_BIO_Mean_Temperature_of_Wettest_Quarter','CHELSA_BIO_Min_Temperature_of_Coldest_Month','CHELSA_BIO_Precipitation_Seasonality','CHELSA_BIO_Precipitation_of_Coldest_Quarter','CHELSA_BIO_Precipitation_of_Driest_Month','CHELSA_BIO_Precipitation_of_Driest_Quarter','CHELSA_BIO_Precipitation_of_Warmest_Quarter','CHELSA_BIO_Precipitation_of_Wettest_Month','CHELSA_BIO_Precipitation_of_Wettest_Quarter','CHELSA_BIO_Temperature_Annual_Range','CHELSA_BIO_Temperature_Seasonality','CIFOR_TropicalPeatlandDepth','CIFOR_TropicalPeatlandExtent','CMS_HeterotrophicRespiration_usingEquationFromBondLamberty2004','CMS_HeterotrophicRespiration_usingEquationFromSubke2006','CMS_SoilRespiration_mean','CSP_Global_Human_Modification','ConsensusLandCoverClass_Barren','ConsensusLandCoverClass_Cultivated_and_Managed_Vegetation','ConsensusLandCoverClass_Deciduous_Broadleaf_Trees','ConsensusLandCoverClass_Evergreen_Broadleaf_Trees','ConsensusLandCoverClass_Evergreen_Deciduous_Needleleaf_Trees','ConsensusLandCoverClass_Herbaceous_Vegetation','ConsensusLandCoverClass_Mixed_Other_Trees','ConsensusLandCoverClass_Open_Water','ConsensusLandCoverClass_Regularly_Flooded_Vegetation','ConsensusLandCoverClass_Shrubs','ConsensusLandCoverClass_Snow_Ice','ConsensusLandCoverClass_Urban_Builtup','ConsensusLandCover_Human_Development_Percentage','CrowtherLab_Tree_Density','EarthEnvCloudCover_CloudForestPrediction','EarthEnvCloudCover_Mean','EarthEnvTexture_CoOfVar_EVI','EarthEnvTexture_Contrast_EVI','EarthEnvTexture_Correlation_EVI','EarthEnvTexture_Dissimilarity_EVI','EarthEnvTexture_Entropy_EVI','EarthEnvTexture_Evenness_EVI','EarthEnvTexture_Homogeneity_EVI','EarthEnvTexture_Maximum_EVI','EarthEnvTexture_Range_EVI','EarthEnvTexture_Shannon_Index','EarthEnvTexture_Simpson_Index','EarthEnvTexture_Std_EVI','EarthEnvTexture_Uniformity_EVI','EarthEnvTexture_Variance_EVI','EarthEnvTopoMed_1stOrderPartialDerivEW','EarthEnvTopoMed_1stOrderPartialDerivNS','EarthEnvTopoMed_2ndOrderPartialDerivEW','EarthEnvTopoMed_2ndOrderPartialDerivNS','EarthEnvTopoMed_AspectCosine','EarthEnvTopoMed_AspectSine','EarthEnvTopoMed_Eastness','EarthEnvTopoMed_Elevation','EarthEnvTopoMed_Northness','EarthEnvTopoMed_ProfileCurvature','EarthEnvTopoMed_Roughness','EarthEnvTopoMed_Slope','EarthEnvTopoMed_TangentialCurvature','EarthEnvTopoMed_TerrainRuggednessIndex','EarthEnvTopoMed_TopoPositionIndex','EarthEnvTopoMed_VectorRuggednessMeasure','EsaCci_BurntAreasProbability','FanEtAl_Depth_to_Water_Table_AnnualMean','FanEtAl_Depth_to_Water_Table_AnnualSD','GHS_Population_Density','GPWv4_Population_Density','GiriEtAl_MangrovesExtent','IPCC_Global_Biomass','MODIS_EVI','MODIS_FPAR','MODIS_GPP','MODIS_LAI','MODIS_NDVI','MODIS_NPP','MODIS_Nadir_Reflectance_Band1','MODIS_Nadir_Reflectance_Band2','MODIS_Nadir_Reflectance_Band3','MODIS_Nadir_Reflectance_Band4','MODIS_Nadir_Reflectance_Band5','MODIS_Nadir_Reflectance_Band6','MODIS_Nadir_Reflectance_Band7','NASA_ForestCanopyHeight','PelletierEtAl_SoilAndSedimentaryDepositThicknesses','SG_Absolute_depth_to_bedrock','SG_Bulk_density_015cm','SG_CEC_015cm','SG_Clay_Content_015cm','SG_Coarse_fragments_015cm','SG_Depth_to_bedrock','SG_H2O_Capacity_015cm','SG_SOC_Content_015cm','SG_SOC_Density_015cm','SG_SOC_Stock_005cm_to_015cm','SG_Saturated_H2O_Content_015cm','SG_Silt_Content_015cm','SG_Soil_H2O_Capacity_pF_20_015cm','SG_Soil_pH_H2O_015cm','SpawnEtAl_HarmonizedAGBiomass','SpawnEtAl_HarmonizedBGBiomass','TootchiEtAl_WetlandsRegularlyFlooded','UNEP_WCMC_Biomass','WCS_Human_Footprint_2009','GLW3_RuminantsDistribution_downsampled10km','GoshEtAl_GlobalGDP2006']
sumParameters = ['GPWv4_Population_2015','GPWv4_Population_2020']
staticParameters = list(set(sampled_data.columns) - set(meanParameters) - set(modeParameters) - set(sumParameters) - set(['area','areaFraction','GID_1']))

# Define the export data frame
exportData = pd.DataFrame(columns=sampled_data.columns, index=range(len(adminUnits)))
exportData['GID_1'] = adminUnits

# Loop over the admin units
for unit in adminUnits:
    # Select each unit
    dat = sampled_data.loc[sampled_data['GID_1'] == unit]

    # Loop over the mode parameters
    for mp in modeParameters:
        # Get the json dict of the mode parameter
        mpDic = list(map(lambda dic: json.loads(dic), list(dat[mp])))
        # Sum over the values of the dict
        mpDicSum = pd.DataFrame(mpDic).sum()
        if mpDicSum.empty == True:
            # Set it to NaN
            exportData.at[exportData[exportData['GID_1']==unit].index.values[0],mp] = np.nan
        else:
            # Append the calculated value to the dataframe
            exportData.at[exportData[exportData['GID_1']==unit].index.values[0],mp] = mpDicSum[mpDicSum == mpDicSum.max()].index[0]

    # Loop over the mean parameters
    for mnP in meanParameters:
        # Get the parameter and the area fraction
        mnP_dat = dat[[mnP ,'areaFraction']].astype(np.float64)
        # Multiply the parameter with the area fraction
        mnP_dat[mnP] = mnP_dat[mnP] * mnP_dat['areaFraction']
        # Append the sum of the weighted parameter and the area fraction
        exportData.at[exportData[exportData['GID_1']==unit].index.values[0],mnP] = mnP_dat.sum()[mnP]
        exportData.at[exportData[exportData['GID_1']==unit].index.values[0],'areaFraction'] = mnP_dat.sum()['areaFraction']

    # Loop over the sum parameters
    for sP in sumParameters:
        # Get the parameter
        sP_dat = dat[[sP]].astype(np.float64)
        # Append the sum of the parameter
        exportData.at[exportData[exportData['GID_1']==unit].index.values[0],sP] = sP_dat.sum()[sP]

    # Add the other parameters
    for sP in staticParameters:
        # Add the static parameters to the export dataframe
        exportData.at[exportData[exportData['GID_1']==unit].index.values[0], sP] = dat[staticParameters].iloc[0][sP]

exportData.to_csv('../data/GADM36_level1.csv')

cols = modeParameters + meanParameters
training_data[cols] = training_data[cols].apply(pd.to_numeric, errors='coerce')
training_data.to_csv('../data/GADM36_trainingData.csv')


##############################################################################################################################
##############################################################################################################################
### CALCULATE WEIGHTS FOR BOOTSTRAPPING

regionNames = pd.read_csv('../data/GlobalRegionsAndGADM.csv', dtype=object, encoding='latin')
sampledRegions = sampled_data[staticParameters + ['area','areaFraction','GID_1']]
merge_df = sampledRegions.merge(regionNames, on='GID_1', suffixes=('', '_duplicate')).astype({"area": np.float64}, errors='raise')

# Remove high income countries and the ones without income group
LMIC_df = merge_df[((merge_df['Income.group'] != 'High income' )) & (( merge_df['Income.group'].notna()))]

# Calculate the areas for the region names
UNRegionAreas = LMIC_df.groupby(['UNRegionName']).sum('area')
UNSubRegionAreas = LMIC_df.groupby(['UNSubRegionName']).sum('area')
WorldBankRegionAreas = LMIC_df.groupby(['World Bank Region']).sum('area')

# Calculate the fractions of each region and export them
UNRegionFractions = UNRegionAreas / UNRegionAreas.sum()
UNSubRegionFractions = UNSubRegionAreas / UNSubRegionAreas.sum()
WorldBankRegionFractions = WorldBankRegionAreas / WorldBankRegionAreas.sum()

UNRegionFractions.to_csv('../data/UNRegionFractions_LMICs.csv')
UNSubRegionFractions.to_csv('../data/UNSubRegionFractions_LMICs.csv')
WorldBankRegionFractions.to_csv('../data/WorldBankRegionFractions_LMICs.csv')
