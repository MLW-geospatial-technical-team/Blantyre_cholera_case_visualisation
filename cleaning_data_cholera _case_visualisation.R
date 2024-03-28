pacman::p_load(sf,
               tidyverse)

  #-------- Loading data ----------------------------#
cholera = read.csv("data/cholera_data/chol_bt.cleaned.csv")
data = read_sf("data/villages/villages_updated_0208.GeoJSON")
nso = read.csv("data/villages/nso/BT_Villages.csv")

#--------------------------CHOLERA--------------------------#
#----capitalizing village and health facility names-----#
cholera$village <- toupper(cholera$village)
cholera$hf <- toupper(cholera$hf)
cholera$hf_cluster <- toupper(cholera$hf_cluster)


colnames(cholera)[colnames(cholera)=="hf"] = "health_facility"

#----Formatting dates for the date_of_onset of cholera----#
cholera$day <- day(cholera$date_of_onset)
cholera$week <- week(cholera$date_of_onset)
cholera$month <- month(cholera$date_of_onset)
cholera$year <- year(cholera$date_of_onset)

#-----Removing spaces for easy matching data-------#
cholera$village = paste0(gsub("\\s+", "", cholera$village))
cholera$village = as.factor(cholera$village)
levels(cholera$village)

#-----Editing names (spelling)
cholera$village = as.character(cholera$village)

cholera$village[cholera$village == "ATMILARESCHOOL"] <- "MILAREATXUL"
cholera$village[cholera$village == "AISECAMP"] <- "AYISE"
cholera$village[cholera$village == "ZION"] <- "ZIONI"
cholera$village[cholera$village == "ZAMBIYA"] <- "ZAMBIA"
cholera$village[cholera$village == "SAFALAWO"] <- "SAFARAWO"
cholera$village[cholera$village == "QUARRY"] <- "SOCHEQUARRY"
cholera$village[cholera$village == "STPATRICK"] <- "STPATRICKS"
cholera$village[cholera$village == "WIKISI"] <- "WISIKI"
cholera$village[cholera$village == "NACHAMBA"] <- "BCAVILLAGE(NACHAMBA)"
cholera$village[cholera$village == "NTOPWA"] <- "MTOPWA"
cholera$village[cholera$village == "MTENGELENI"] <- "MTENGERENI"
cholera$village[cholera$village == "NACHAMBA"] <- "BCAVILLAGE(NACHAMBA)"
cholera$village[cholera$village == "NTOPWA"] <- "MTOPWA"
cholera$village[cholera$village == "MTENGELENI"] <- "MTENGERENI"
cholera$village[cholera$village == "CHILIMBA"] <- "CHIRIMBA"
cholera$village[cholera$village == "NO1"] <- "NUMBER1"
cholera$village[cholera$village == "CHIKUMBA"] <- "CHIKUMBU"
cholera$village[cholera$village == "GREENMAKALAS"] <- "GREENMALATA"
cholera$village[cholera$village == "BUTAO"] <- "BUTAWO"
cholera$village[cholera$village == "DELUNDE"] <- "DERUNDE"
cholera$village[cholera$village == "HAJRA"] <- "HAJIRA"
cholera$village[cholera$village == "SOCHECHIBOWA"] <- "CHIBOWA"
cholera$village[cholera$village == "TENTHE"] <- "NTETHE"
cholera$village[cholera$village == "THANDIZI"] <- "NTHANDIZI"
cholera$village[cholera$village == "TSIKAWANJALA"] <- "MSIKAWANJALA"
cholera$village[cholera$village == "SALVATIONARMY"] <- "SALVATION"
cholera$village[cholera$village == "SOCHE3WAYS"] <- "3WAYS"
cholera$village[cholera$village == "SALANJI"] <- "SALAJI"
cholera$village[cholera$village == "SAIDIMASALA"] <- "MASALA"
cholera$village[cholera$village == "ANGELOGOVEA"] <- "ANGELOGOVEYA"
cholera$village[cholera$village == "ROMANCATHOLICCHURCH"] <- "RCCHURCH"
cholera$village[cholera$village == "QECH"] <- "QUEENS"
cholera$village[cholera$village == "PALATA"] <- "PALATO"
cholera$village[cholera$village == "NVULA"] <- "MVULA"
cholera$village[cholera$village == "NZERU"] <- "MZERU"
cholera$village[cholera$village == "PALATA"] <- "PALATO"
cholera$village[cholera$village == "NO2"] <- "NUMBER2"
cholera$village[cholera$village == "NO3"] <- "NUMBER3"
cholera$village[cholera$village == "NO4"] <- "NUMBER4"
cholera$village[cholera$village == "NO5"] <- "NUMBER5"
cholera$village[cholera$village == "NO7"] <- "NUMBER7"
cholera$village[cholera$village == "NSAMBUZI"] <- "MSAMBUZI"
cholera$village[cholera$village == "NSELEMA"] <- "MSELEMA"
cholera$village[cholera$village == "NSIKAWANJALA"] <- "MSIKAWANJALA"
cholera$village[cholera$village == "NTAMBALIKA"] <- "NTAMBARIKA"
cholera$village[cholera$village == "NTANDIZI"] <- "NTHANDIZI"
cholera$village[cholera$village == "NTELERA"] <- "MTELERA"
cholera$village[cholera$village == "NTENTHE"] <- "NTETHE"
cholera$village[cholera$village == "NDIRANDEHILLS"] <- "NDIRANDEHIL"
cholera$village[cholera$village == "NEARBALUTI"] <- "BALUTI"
cholera$village[cholera$village == "NKOKA"] <- "MKOKA"
cholera$village[cholera$village == "NKUWEFA"] <- "NKUWEYA"
cholera$village[cholera$village == "NKWATE"] <- "MKWATE"
cholera$village[cholera$village == "NAKHOKA"] <- "NANTHOKA"
cholera$village[cholera$village == "NAMALO"] <- "NAMALU"
cholera$village[cholera$village == "MWINGANYAMA"] <- "MWINANYAMA"
cholera$village[cholera$village == "MWAMWADI"] <- "MWAMADI"
cholera$village[cholera$village == "MWANCHANDE"] <- "MWACHANDE"
cholera$village[cholera$village == "MWAYIWALA"] <- "MWAIWALA"
cholera$village[cholera$village == "MTPLEASANT"] <- "MOUNTPLESANT"
cholera$village[cholera$village == "MTENDERENEAR"] <- "MTENDERE"
cholera$village[cholera$village == "MTHANDIZI"] <- "NTHANDIZI"
cholera$village[cholera$village == "MTHUNDU"] <- "THUNDU"
cholera$village[cholera$village == "MLUNGUZI"] <- "MULUNGUZIGROUND"
cholera$village[cholera$village == "MNONDIWA"] <- "MONDIWA"
cholera$village[cholera$village == "MNTHANDIZI"] <- "NTHANDIZI"
cholera$village[cholera$village == "MNYAKANEAR"] <- "NYAKA"
cholera$village[cholera$village == "MONIWA"] <- "MONDIWA"
cholera$village[cholera$village == "MIDZENJE"] <- "MIZENJE"
cholera$village[cholera$village == "MILALE"] <- "MILARE"
cholera$village[cholera$village == "MINYONGA"] <- "CHINYONGA"
cholera$village[cholera$village == "MISEU6"] <- "MISEWU6"
cholera$village[cholera$village == "MIYANGA"] <- "NAMIYANGO"
cholera$village[cholera$village == "MKAIMBA"] <- "NKAIMBA"
cholera$village[cholera$village == "MKHUKUTENI"] <- "NKHUKUTENI"
cholera$village[cholera$village == "MKAMBA"] <- "KAMBA"
cholera$village[cholera$village == "MKHWATE"] <- "MKWATE"
cholera$village[cholera$village == "MKWAPATIRA"] <- "MKWAPATILA"
cholera$village[cholera$village == "MBAYA"] <- "MBAYANI"
cholera$village[cholera$village == "MBELEWERE"] <- "MBEREWELE"
cholera$village[cholera$village == "MBOKOLA"] <- "KUMBOKOOLA"
cholera$village[cholera$village == "MBWANA"] <- "M'BWANA"
cholera$village[cholera$village == "MBWINJA"] <- "M'BWINJA"
cholera$village[cholera$village == "MDAWA"] <- "DAWA"
cholera$village[cholera$village == "NANTCHOLI"] <- "NATCHOLI"
cholera$village[cholera$village == "MATCHOMBE"] <- "MANTCHOMBE"
cholera$village[cholera$village == "MATHUNDI"] <- "THUNDU"
cholera$village[cholera$village == "MASAJIRI"] <- "MASAJILI"
cholera$village[cholera$village == "MASAME"] <- "SEMU"
cholera$village[cholera$village == "MATALA"] <- "MATALALA"
cholera$village[cholera$village == "MALESIA"] <- "MALASIA"
cholera$village[cholera$village == "MALATA"] <- "GREENMALATA"
cholera$village[cholera$village == "MALESYA"] <- "MALASIA"
cholera$village[cholera$village == "MALINGAMOYO"] <- "MALUNGAMOYO"
cholera$village[cholera$village == "MANCHOMBE"] <- "MANTCHOMBE"
cholera$village[cholera$village == "MANDA"] <- "KUMANDA"
cholera$village[cholera$village == "MANGU"] <- "MANGO"
cholera$village[cholera$village == "MANG`OMA"] <- "MANG'OMA"
cholera$village[cholera$village == "MANGOCHI"] <- "MANGOCHIA"
cholera$village[cholera$village == "M`BWINJA"] <- "M'BWINJA"
cholera$village[cholera$village == "MAGOBODIP"] <- "MAGOMBODIP"
cholera$village[cholera$village == "MAJISA"] <- "MAJIGA"
cholera$village[cholera$village == "MAGENGA"] <- "MAJIGA"
cholera$village[cholera$village == "MAGIGA"] <- "MAJIGA"
cholera$village[cholera$village == "MAGISA"] <- "MAJIGA"
cholera$village[cholera$village == "MALANJA"] <- "MANJA"
cholera$village[cholera$village == "MALABATI"] <- "MALABADA"
cholera$village[cholera$village == "LIKHUBULA"] <- "LIKHUBULANEARPACT"
cholera$village[cholera$village == "LIRADALA"] <- "LIDALA"
cholera$village[cholera$village == "LIVINGWATERS"] <- "CHIMWANKHUNDALIVINGWATERS"
cholera$village[cholera$village == "M'BWELERA"] <- "M’BWELERA"
cholera$village[cholera$village == "KIMU"] <- "CHEKIMU"
cholera$village[cholera$village == "KOLOMBOLA"] <- "KALOMBOLA"
cholera$village[cholera$village == "KUMANJE"] <- "MANJE"
cholera$village[cholera$village == "KUMWEMBA"] <- "KUMWEMBE"
cholera$village[cholera$village == "KUNTAYA"] <- "NTAYA"
cholera$village[cholera$village == "KWATEVILLAGE"] <- "MKWATE"
cholera$village[cholera$village == "KILK"] <- "CHEKIMU"
cholera$village[cholera$village == "KAPENA"] <- "KAPENI"
cholera$village[cholera$village == "KAPICHI"] <- "KAPUCHI"
cholera$village[cholera$village == "KATSALABANDE"] <- "KASALABANDE"
cholera$village[cholera$village == "KALIMIRAMOTO"] <- "KALIMIMOTO"
cholera$village[cholera$village == "KALIYATI"] <- "KALIATI"
cholera$village[cholera$village == "KAMONDE"] <- "NAMONDE"
cholera$village[cholera$village == "KAMTIMBANYA"] <- "KANTIMBANYA"
cholera$village[cholera$village == "KANDONJE"] <- "KANDOJE"
cholera$village[cholera$village == "KANFUPA"] <- "KAFUPA"
cholera$village[cholera$village == "GAYESI"] <- "GAESI"
cholera$village[cholera$village == "GEORGE"] <- "GEORGEVILLAGE"
cholera$village[cholera$village == "GROLIA"] <- "GLORIA"
cholera$village[cholera$village == "JIYA"] <- "NJIYA"
cholera$village[cholera$village == "KADAMMANJA"] <- "KADAMANJA"
cholera$village[cholera$village == "GAMULA"] <- "GAMULANI"
cholera$village[cholera$village == "DZIKUPU"] <- "DZIKUPI"
cholera$village[cholera$village == "DELANDE"] <- "DERUNDE"
cholera$village[cholera$village == "CHURCH"] <- "ZAMBEZICHURCH"
cholera$village[cholera$village == "CHRIRMBA"] <- "CHIRIMBA"
cholera$village[cholera$village == "CHOKIM"] <- "CHEKIMU"
cholera$village[cholera$village == "CHISA"] <- "CHIMWANKHUNDACHISA"
cholera$village[cholera$village == "CHISI"] <- "CHIMWANKHUNDACHISA"
cholera$village[cholera$village == "CHISWOGA"] <- "CHISONGA"
cholera$village[cholera$village == "CHITAKA"] <- "CHITAKALE"
cholera$village[cholera$village == "CHITSA"] <- "CHIMWANKHUNDACHISA"
cholera$village[cholera$village == "CHITUPULE"] <- "CHINUPULE,NEARMAKHETHA"
cholera$village[cholera$village == "CHINUPULE"] <- "CHINUPULE,NEARMAKHETHA"
cholera$village[cholera$village == "CHINUPULENEARMAKHETAMARKETPLOTSAIDI"] <- "CHINUPULE,NEARMAKHETHA"
cholera$village[cholera$village == "CHINUPLEVGENEARNDILEKENI"] <- "NDILEKENI"
cholera$village[cholera$village == "CHINUPUIE1NEARPHIRI"] <- "CHINUPULE1"
cholera$village[cholera$village == "CHINUKULE1NEARSTANCESCHOOL"] <- "CHINUPULE1"
cholera$village[cholera$village == "CHINUKULE1NEARMAIRACHIEFHOUSE"] <- "CHINUPULE1"
cholera$village[cholera$village == "CHINTUMBIRA"] <- "CHIMTUMBIRA"
cholera$village[cholera$village == "CHINTUMBIRE"] <- "CHIMTUMBIRA"
cholera$village[cholera$village == "CHINTUBIRA"] <- "CHIMTUMBIRA"
cholera$village[cholera$village == "CHINSEUVILLAGE"] <- "CHINSEU"
cholera$village[cholera$village == "CHINSEUNEARCHIBUKUDEPORT"] <- "CHINSEUBEHINDTARVEN"
cholera$village[cholera$village == "CHINSEUVGENEARLIZEO"] <- "CHINSEU"
cholera$village[cholera$village == "CHINSEUNEARLEZEOMARKET"] <- "CHINSEU"
cholera$village[cholera$village == "CHINSEUNEARBLM"] <- "CHINSEU"
cholera$village[cholera$village == "CHINDEKANEARNURSERY"] <- "CHINDEKA"
cholera$village[cholera$village == "CHINDEMU"] <- "CHINDEVU"
cholera$village[cholera$village == "CHING`AMBA"] <- "CHING'AMBA"
cholera$village[cholera$village == "CHING`AMBANEARBOREHOLE"] <- "CHING'AMBA"
cholera$village[cholera$village == "CHING`AMBANEARGVH"] <- "CHING'AMBA"
cholera$village[cholera$village == "CHING`AMBANEARNTONDOKO"] <- "CHING'AMBA"
cholera$village[cholera$village == "CHING`OMBENEARBOREHOLE"] <- "CHING'OMBE"
cholera$village[cholera$village == "CHING`OMBENEARPRIMARYSCHOOL"] <- "CHING'OMBE"
cholera$village[cholera$village == "CHING`OMBEVGE"] <- "CHING'OMBE"
cholera$village[cholera$village == "CHINGAMBANEARGVHCHINGAMBA"] <- "CHING'AMBA"
cholera$village[cholera$village == "CHINGUNKHAPATSOGO"] <- "CHINGUKAPATSOGO"
cholera$village[cholera$village == "CHINJINGANTHANDIZI"] <- "NTHANDIZI"
cholera$village[cholera$village == "CHILUNDUKA"] <- "CHILUNDUKAA"
cholera$village[cholera$village == "CHIMANDA"] <- "KUMANDA"
cholera$village[cholera$village == "CHIMKANDE"] <- "CHIMKANDA"
cholera$village[cholera$village == "CHIMKWINJA"] <- "MAKWINJA"
cholera$village[cholera$village == "CHIMOWA"] <- "KAMOWA"
cholera$village[cholera$village == "CHIMWAMALINGAMOYO"] <- "MALUNGAMOYO"
cholera$village[cholera$village == "CHIMWANKHUNDAMALINGAMOYO"] <- "MALUNGAMOYO"
cholera$village[cholera$village == "CHIMWANKHUDA"] <- "CHIMWANKHUNDA"
cholera$village[cholera$village == "CHIMWANKHUNDANEARDAM"] <- "CHIMWAKHUNDADAM"
cholera$village[cholera$village == "CHIMWANKHUNDADECCHITSA"] <- "CHIMWANKHUNDACHISA"
cholera$village[cholera$village == "CHINDEKANEARNURSERY"] <- "CHINDEKA"
cholera$village[cholera$village == "CHILAULO"] <- "CHILAURO"
cholera$village[cholera$village == "CHIIMIRE"] <- "CHIIMILE"
cholera$village[cholera$village == "ATMILARESCHOOL"] <- "MILAREATXUL"
cholera$village[cholera$village == "BAYANI"] <- "MBAYANI"
cholera$village[cholera$village == "BIBAKANTUKULE"] <- "KANTUKULE"
cholera$village[cholera$village == "BVA"] <- "BCA"
cholera$village[cholera$village == "CAVARYFAMILYCHURCH"] <- "CALVARYFAMILYCHURCH"
cholera$village[cholera$village == "CHAKANIKA"] <- "CHAKANA"
cholera$village[cholera$village == "CHANGWIRA"] <- "CHAGWIRAUTA"
cholera$village[cholera$village == "CHAVALA"] <- "CHABVALA"
cholera$village[cholera$village == "CHEMALUWA"] <- "MALUWA"
cholera$village[cholera$village == "CHEMUJA"] <- "CHEMUSA"
cholera$village[cholera$village == "CHESOMBA"] <- "SOMBA"
cholera$village[cholera$village == "CHENSOMBA"] <- "SOMBA"
cholera$village[cholera$village == "NANCHOLI"] <- "NATCHOLI"
cholera$village[cholera$village == "NDIRANDEHIL"] <- "NDILANDEHIL"
cholera$village[cholera$village == "MJAMBE"] <- "NJAMBA"
cholera$village[cholera$village == "KANUNKHAPHIRI"] <- "KANUNKHAMPINI"
cholera$village[cholera$village == "CHILORE"] <- "CHILOBWE"
cholera$village[cholera$village == "CHIKIWA"] <- "CHEKIMU"
cholera$village[cholera$village == "CHAUNJE"] <- "CHAWANJE"
cholera$village[cholera$village == "ESAYA"] <- "YESAYA"
cholera$village[cholera$village == "MASINDA"] <- "MASINDE"
cholera$village[cholera$village == "MISINDE"] <- "MASINDE"
cholera$village[cholera$village == "MMANGANI"] <- "MMANGENI"
cholera$village[cholera$village == "UZI"] <- "CHEUZI"
cholera$village[cholera$village == "MOYA"] <- "CHEMOYA"
cholera$village[cholera$village == "CHITHA"] <- "CHATHA"
cholera$village[cholera$village == "CHIHERE"] <- "CHIWERE"
cholera$village[cholera$village == "MATAKA"] <- "MAKATA"
cholera$village[cholera$village == "GAMULA"] <- "GAMULANI"
cholera$village[cholera$village == "CHAKANIKA"] <- "CHAKANA"
cholera$village[cholera$village == "NKHONO"] <- "KHOKO"
cholera$village[cholera$village == "ZANYEMBA"] <- "ZAMANEMBA"
cholera$village[cholera$village == "YALIWA"] <- "NALIWA"
cholera$village[cholera$village == "MATHYOWA"] <- "MATCHOWA"
cholera$village[cholera$village == "MBUZI"] <- "MBOZI"
cholera$village[cholera$village == "MPWINYIRA"] <- "PWINYIZA"
cholera$village[cholera$village == "MPHWINIZA"] <- "PWINYIZA"
cholera$village[cholera$village == "KHUMBANYIWA"] <- "MANEYA"
cholera$village[cholera$village == "CHASWANTHA"] <- "CHASANTHAKA"
cholera$village[cholera$village == "CHIMPANJE"] <- "CHIMPANGO"
cholera$village[cholera$village == "MKUNJE"] <- "MAKUNJE"
cholera$village[cholera$village == "CHILEMBE"] <- "CHILEMBWE"
cholera$village[cholera$village == "CCAPBOREHORE"] <- "MAKALANI"
cholera$village[cholera$village == "MALENGA"] <- "MULENGA"
cholera$village[cholera$village == "MALEYA"] <- "MALEKWA"
cholera$village[cholera$village == "BALEYA"] <- "BULEYA"
cholera$village[cholera$village == "MZITO"] <- "NZITO"
cholera$village[cholera$village == "MSITO"] <- "NZITO"
cholera$village[cholera$village == "NTUTA"] <- "MTUTA"
cholera$village[cholera$village == "NGOGOLO"] <- "NDOGOLO"
cholera$village[cholera$village == "MBAMBALA"] <- "PHAMBALA"
cholera$village[cholera$village == "MOLEKWA"] <- "MALEKWA"
cholera$village[cholera$village == "MBAMA"] <- "MBOMA"
cholera$village[cholera$village == "MATLAS"] <- "MATALALA"
cholera$village[cholera$village == "CHIMATA"] <- "CHIMALA"
cholera$village[cholera$village == "CHAUNJE"] <- "CHAWANJE"
cholera$village[cholera$village == "CHEMBOMA"] <- "CHIBONA"
cholera$village[cholera$village == "CHIWERE"] <- "CHIWEMBE"
cholera$village[cholera$village == "CHOKIM"] <- "CHEKIMU"
cholera$village[cholera$village == "KIMU"] <- "CHEKIMU"
cholera$village[cholera$village == "KUMWAMBE"] <- "KUMWEMBE"
cholera$village[cholera$village == "KUMWEMBA"] <- "KUMWEMBE"
cholera$village[cholera$village == "MATALA"] <- "MATALALA"
cholera$village[cholera$village == "MLESO"] <- "MULESO"
cholera$village[cholera$village == "QUARRY"] <- "SOCHEQUARRY"
cholera$village[cholera$village == "QURRY"] <- "SOCHEQUARRY"
cholera$village[cholera$village == "SIMON"] <- "SIMONMTAMBO"
cholera$village[cholera$village == "MTAMBO"] <- "SIMONMTAMBO"
cholera$village[cholera$village == "KUTCHIRE"] <- "KUTCHILI"
cholera$village[cholera$village == "NKUMBA"] <- "MKUMBA"
cholera$village[cholera$village == "ZANGANGUWO"] <- "ZINGANGUWO"
cholera$village[cholera$village == "JEWETANEAR"] <- "JEWETA1"
cholera$village[cholera$village == "NAMONDA"] <- "NAMONDE"
cholera$village[cholera$village == "GOMBA"] <- "GOMBE"
cholera$village[cholera$village == "CHIMKANDE"] <- "CHIMKANDA"
cholera$village[cholera$village == "CHINDEMU"] <- "CHINDEBVU"
cholera$village[cholera$village == "CHINTUMBIRE"] <- "CHINTUMBIRA"
cholera$village[cholera$village == "MAGOMBODIP"] <- "MAGOMBO"
cholera$village[cholera$village == "MALENGU"] <- "MULENGA"
cholera$village[cholera$village == "MALEYA"] <- "MALIYA"
cholera$village[cholera$village == "MTIMA"] <- "MTIZA"
cholera$village[cholera$village == "NKUWEFA"] <- "NKUWEYA"
cholera$village[cholera$village == "MPHEMBU"] <- "MPEMBU"
cholera$village[cholera$village == "MAPLOT"] <- "GOLIRO"
cholera$village[cholera$village == "MAPUTO"] <- "GOLIRO"
cholera$village[cholera$village == "CHAKANIKA"] <- "CHAKANA"
cholera$village[cholera$village == "GAMULA"] <- "GAMULANI"
cholera$village[cholera$village == "MALIGA"] <- "MAJIGA"
cholera$village[cholera$village == "MAGIGA"] <- "MAJIGA"
cholera$village[cholera$village == "MAGISA"] <- "MAJIGA"
cholera$village[cholera$village == "MAHATA"] <- "GREENMALATA"
cholera$village[cholera$village == "CHAKAWA"] <- "CHAKANA"
cholera$village[cholera$village == "MAJISA"] <- "MAJIGA"
cholera$village[cholera$village == "MBEMBUBASAYAPLOT"] <- "MPEMBU"
cholera$village[cholera$village == "MALABATI"] <- "MALABADA"
cholera$village[cholera$village == "MUNAPA"] <- "NAMATAPA"
cholera$village[cholera$village == "MSIKI"] <- "WISIKIBISANI"
cholera$village[cholera$village == "MWANJIRA"] <- "GOMANJIRA"
cholera$village[cholera$village == "NGOMANJIRA"] <- "GOMANJIRA"
cholera$village[cholera$village == "NKOMANJIRA"] <- "GOMANJIRA"
cholera$village[cholera$village == "CHEUCHEU"] <- "CHEUZI"
cholera$village[cholera$village == "ESAYA"] <- "YESAYA"
cholera$village[cholera$village == "KUBANO"] <- "KABANO"
cholera$village[cholera$village == "MASINDA"] <- "MASINDE"
cholera$village[cholera$village == "MISINDE"] <- "MASINDE"
cholera$village[cholera$village == "MMANGANI"] <- "MMANGENI"
cholera$village[cholera$village == "UZI"] <- "CHEUZI"
cholera$village[cholera$village == "FASANINEARJECOM"] <- "PASANI"
cholera$village[cholera$village == "MSAYANI"] <- "MBAYANI"
cholera$village[cholera$village == "CHIGONEKA"] <- "CHIGONAWAYA"
cholera$village[cholera$village == "PHWINYILA"] <- "PHWINYIZA"
cholera$village[cholera$village == "CHIDZOLA"] <- "CHOZOLA"
cholera$village[cholera$village == "DEBERE"] <- "MBEMBELE"
cholera$village[cholera$village == "KUDOMWE"] <- "DOMWE"
cholera$village[cholera$village == "KWANTOCHA"] <- "NTOCHA"
cholera$village[cholera$village == "MACHIZA"] <- "MACHILA"
cholera$village[cholera$village == "MASENDANAN"] <- "MASELEMA"
cholera$village[cholera$village == "MATATA"] <- "MAKATA"
cholera$village[cholera$village == "NAKAYA"] <- "STAYA"
cholera$village[cholera$village == "RNSAMBANI"] <- "RNSAMBUZI"
cholera$village[cholera$village == "SUMANJE"] <- "SOMANJE"
cholera$village[cholera$village == "MASAL"] <- "MASALA"
cholera$village[cholera$village == "SIGELEGE"] <- "SIGEREGE"
cholera$village[cholera$village == "KACHELE"] <- "KACHERE"
cholera$village[cholera$village == "WILLIAN"] <- "WILLIAM"
cholera$village[cholera$village == "WIKISE"] <- "WISIKI"
cholera$village[cholera$village == "CHILOMOMI"] <- "CHILOMONI"
cholera$village[cholera$village == "NANCHOII"] <- "NANCHOLI"
cholera$village[cholera$village == "NANCHOLO"] <- "NANCHOLI"
cholera$village[cholera$village == "BEN"] <- "BENI"
cholera$village[cholera$village == "CHEKIWA"] <- "CHEKIMU"
cholera$village[cholera$village == "CHEM`MADI"] <- "CHEMMADI"
cholera$village[cholera$village == "CHEUDZI"] <- "CHEUZI"
cholera$village[cholera$village == "CHHIWEMBE"] <- "CHIWEMBE"
cholera$village[cholera$village == "CHISEU"] <- "CHINSEU"
cholera$village[cholera$village == "MANANSE"] <- "MANASE"
cholera$village[cholera$village == "MATENGE"] <- "MATENJE"
cholera$village[cholera$village == "UNDERSON"] <- "ANDERSON"
cholera$village[cholera$village == "BAGIDADI"] <- "BAGHDAD"
cholera$village[cholera$village == "BAGDAD"] <- "BAGHDAD"
cholera$village[cholera$village == "CHILUNDUKAA"] <- "CHILUNDUKA"
cholera$village[cholera$village == "CHIMSEWU"] <- "CHINSEU"
cholera$village[cholera$village == "CHINUPUENEARMAKHETAMARKETPLOTSAIDI"] <- "CHINUPULENEARMAKHETHAMARKETPLOTSAIDI"
cholera$village[cholera$village == "LIRAKA"] <- "LILAKA"
cholera$village[cholera$village == "SOLOMONI"] <- "SOLOMON"
cholera$village[cholera$village == "KANTSIDZI"] <- "KANSIZI"
cholera$village[cholera$village == "KAPHITAMTAMA"] <- "KAPHIKANTAMA"
cholera$village[cholera$village == "KAPHIKAMTAMA"] <- "KAPHIKANTAMA"
cholera$village[cholera$village == "KANING"] <- "KANING'A"
cholera$village[cholera$village == "KREENMALATA"] <- "GREENMALATA"
cholera$village[cholera$village == "MALORA"] <- "MALOLA"
cholera$village[cholera$village == "KZEMBE"] <- "KAZEMBE"
cholera$village[cholera$village == "KHOMBWDE"] <- "KHOMBWE"
cholera$village[cholera$village == "SUNSIDE"] <- "SUNNYSIDE"
cholera$village[cholera$village == "SUNNY"] <- "SUNNYSIDE"
cholera$village[cholera$village == "NAMCHOLI"] <- "NANCHOLI"
cholera$village[cholera$village == "NSELEMU"] <- "MSELEMU"
cholera$village[cholera$village == "WENERA"] <- "WENELA"
cholera$village[cholera$village == "NAMIANGO"] <- "NAMIYANGO"
cholera$village[cholera$village == "NAMATUTULE"] <- "NAMATETULE"
cholera$village[cholera$village == "NAMATULULE"] <- "NAMATETULE"
cholera$village[cholera$village == "NACHOLI"] <- "NANCHOLI"
cholera$village[cholera$village == "NATCHOLI"] <- "NANCHOLI"
cholera$village[cholera$village == "SAME"] <- "SEMU"
cholera$village[cholera$village == "CHINSEUVGE"] <- "CHINSEU"
cholera$village[cholera$village == "CHOLOMONI"] <- "CHILOMONI"
cholera$village[cholera$village == "CHRIMBA"] <- "CHIRIMBA"
cholera$village[cholera$village == "WIKISIBISANI"] <- "WISIKIBISANI"
cholera$village[cholera$village == "NG`OMBAER"] <- "NG'OMBERA"
cholera$village[cholera$village == "CHIRIPRISON"] <- "CHICHIRIPRISON"
cholera$village[cholera$village == "CHIRAMBE"] <- "CHILAMBE"
cholera$village[cholera$village == "G-CORNER"] <- "GREENCORNER"
cholera$village[cholera$village == "LUKERESDENCE"] <- "LUKERESIDENCE"
cholera$village[cholera$village == "MACHIRA"] <- "MACHILA"
cholera$village[cholera$village == "M`DALA"] <- "MDALA"
cholera$village[cholera$village == "KUMBOKOLA"] <- "KUMBOKOLA"
cholera$village[cholera$village == "NTAMBARIKA"] <- "MTAMBALIKA"
cholera$village[cholera$village == "GOLIO"] <- "GOLIYO"
cholera$village[cholera$village == "GOLIRO"] <- "GOLIYO"
cholera$village[cholera$village == "MALESYIA"] <- "MALASIA"
cholera$village[cholera$village == "CHIMKANDA"] <- "CHINKANDA"
cholera$village[cholera$village == "LUNDA"] <- "LUNDU"
cholera$village[cholera$village == "CHIMIRE"] <- "CHIIMILE"
cholera$village[cholera$village == "CHINGOTANEARCHIEF"] <- "CHINGOTA"
cholera$village[cholera$village == "CHINUPULENEARMAKHETHAMARKETPLOTSAIDI"] <- "CHINUPULE,NEARMAKHETHA"
cholera$village[cholera$village == "CHINGOTANEARCHIEF"] <- "CHINGOTA"
cholera$village[cholera$village == "KAUSIWA2"] <- "KAUSIWA"
cholera$village[cholera$village == "KWANYAMATA"] <- "ANYAMATA"
cholera$village[cholera$village == "LILAKA"] <- "WISIKILILAKA"
cholera$village[cholera$village == "MALIONGA"] <- "MALONGA"
cholera$village[cholera$village == "MARIYA"] <- "MARIA"
cholera$village[cholera$village == "MASANJARA"] <- "MASANJALA"
cholera$village[cholera$village == "MBANYANU"] <- "MBAYANI"
cholera$village[cholera$village == "MBELEWELE"] <- "MBELEWERE"
cholera$village[cholera$village == "MBEREWERE"] <- "MBELEWERE"
cholera$village[cholera$village == "MESESA"] <- "MISESA"
cholera$village[cholera$village == "MNGOMANJIRA"] <- "MG`OMANJIRA"
cholera$village[cholera$village == "MKUMBEZI"] <- "MKOMBEZI"
cholera$village[cholera$village == "MMBOYA"] <- "NAMBOYA"
cholera$village[cholera$village == "MPIGWE"] <- "MPINGWE"
cholera$village[cholera$village == "MPWINGWE"] <- "MPINGWE"
cholera$village[cholera$village == "MSEREMU"] <- "MSELEMU"
cholera$village[cholera$village == "MUBAS"] <- "POLYHOSTEL"
cholera$village[cholera$village == "MWASAMBO"] <- "MWANSAMBO"
cholera$village[cholera$village == "NAMWANJE"] <- "NAMWANJESCHOOL"
cholera$village[cholera$village == "NANCHAMBA"] <- "BCAVILLAGE(NACHAMBA)"
cholera$village[cholera$village == "NG`OMBAERA"] <- "NG'OMBERA"
cholera$village[cholera$village == "NKHUKUTEN"] <- "NKHUKUTENI"
cholera$village[cholera$village == "NKUKUTENI"] <- "NKHUKUTENI"
cholera$village[cholera$village == "NKUNG`UNDA"] <- "NKUNG'UNDA"
cholera$village[cholera$village == "NSUSA"] <- "MSUSA"
cholera$village[cholera$village == "PAGAMA"] <- "GAMA"
cholera$village[cholera$village == "PANSIKA"] <- "MSIKA"
cholera$village[cholera$village == "QECHGUARDIAN"] <- "QUEENS"
cholera$village[cholera$village == "REALWAYS"] <- "RAILWAYS"
cholera$village[cholera$village == "SOCHE"] <- "SOCHEQUARRY"
cholera$village[cholera$village == "WANELA"] <- "WENELA"
cholera$village[cholera$village == "KWAAGAMA"] <- "GAMA"
cholera$village[cholera$village == "NJIRIKA"] <- "NJILIKA"
cholera$village[cholera$village == "MARIA"] <- "MALIYA"



cholera$village = as.factor(cholera$village)
levels(cholera$village)

#---Rearanging columns---#
cholera <- select(cholera, village, health_facility, ta, age, sex, date_of_onset, day, week, month, year, date_hf, date_specimen,
                  rdt_result, culture_result, epi_link, case_status, treatment, outcome, vacc_status, vacc_dosage, date_last_dose,
                  age_cat, age_2, hf_cluster, urban_rural)

##############################################################################################
#####Grouping cases by health facility
ameca_chilaweni <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "AMECA")

bangwe <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "BANGWE")

chavala <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHABVALA")

chichiri_prison <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHICHIRI PRISON")

chikowa <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHIKOWA")

chileka <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHILEKA")

chilomoni <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHILOMONI")

chimembe <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHIMEMBE")

chirimba <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHIRIMBA")

dziwe <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "DZIWE")

gateway <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "GATEWAY")

kachere <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "KACHERE")

kadidi <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "KADIDI")

lighthouse <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LIGHTHOUSE")

limbe <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LIMBE")

lirangwe <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LIRANGWE")

lundu <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LUNDU")

madziabango <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MADZIABANGO")

makata <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MAKATA")

makhetha <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MAKHETHA")

mbayani <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MBAYANI")

mdeka <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MDEKA")

mlambe <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MLAMBE")

mpemba <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MPEMBA")

mubas <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MUBAS")

namikoko <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "NAMIKOKO")

ndirande <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "NDIRANDE")

qech <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "QECH")

sochematernity <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "SOCHE MATERNITY")

southlunzu <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "SOUTH LUNZU")

zingwangwa <- cholera %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "ZINGWANGWA")
##################################################################
#---------------------DATA VILLAGES--------------------------#

#----capitalizing village and health facility names-----#
data$`Village name` = as.factor(data$`Village name`)
levels(data$`Village name`)

data$`Village name` <- toupper(data$`Village name`)
data$`Health facility name` <- toupper(data$`Health facility name`)

#-------- Cleaning the village data ----------------------------#

data$`Village name` = as.factor(data$`Village name`)
data$`Health facility name` = as.factor(data$`Health facility name`) 

colnames(data)[colnames(data)=="Village name"] = "village"
colnames(data)[colnames(data)=="Health facility name"] = "health_facility"


#-----Removing spaces for easy matching data-------#
data$village = paste0(gsub("\\s+", "", data$village))
data$village = as.factor(data$village)
levels(data$village)

#-----Editing names (spelling)
data$village = as.character(data$village)

data$village[data$village == "AISECAMP"] <- "AYISE"
data$village[data$village == "ZION"] <- "ZIONI"
data$village[data$village == "ZAMBIYA"] <- "ZAMBIA"
data$village[data$village == "SAFALAWO"] <- "SAFARAWO"
data$village[data$village == "QUARRY"] <- "SOCHEQUARRY"
data$village[data$village == "STPATRICK"] <- "STPATRICKS"
data$village[data$village == "WIKISI"] <- "WISIKI"
data$village[data$village == "NACHAMBA"] <- "BCAVILLAGE(NACHAMBA)"
data$village[data$village == "NTOPWA"] <- "MTOPWA"
data$village[data$village == "MTENGELENI"] <- "MTENGERENI"
data$village[data$village == "NACHAMBA"] <- "BCAVILLAGE(NACHAMBA)"
data$village[data$village == "NTOPWA"] <- "MTOPWA"
data$village[data$village == "MTENGELENI"] <- "MTENGERENI"
data$village[data$village == "CHILIMBA"] <- "CHIRIMBA"
data$village[data$village == "NO1"] <- "NUMBER1"
data$village[data$village == "CHIKUMBA"] <- "CHIKUMBU"
data$village[data$village == "GREENMAKALAS"] <- "GREENMALATA"
data$village[data$village == "BUTAO"] <- "BUTAWO"
data$village[data$village == "DELUNDE"] <- "DERUNDE"
data$village[data$village == "HAJRA"] <- "HAJIRA"
data$village[data$village == "SOCHECHIBOWA"] <- "CHIBOWA"
data$village[data$village == "TENTHE"] <- "NTETHE"
data$village[data$village == "THANDIZI"] <- "NTHANDIZI"
data$village[data$village == "TSIKAWANJALA"] <- "MSIKAWANJALA"
data$village[data$village == "SALVATIONARMY"] <- "SALVATION"
data$village[data$village == "SOCHE3WAYS"] <- "3WAYS"
data$village[data$village == "SALANJI"] <- "SALAJI"
data$village[data$village == "SAIDIMASALA"] <- "MASALA"
data$village[data$village == "ANGELOGOVEA"] <- "ANGELOGOVEYA"
data$village[data$village == "ROMANCATHOLICCHURCH"] <- "RCCHURCH"
data$village[data$village == "QECH"] <- "QUEENS"
data$village[data$village == "PALATA"] <- "PALATO"
data$village[data$village == "NVULA"] <- "MVULA"
data$village[data$village == "NZERU"] <- "MZERU"
data$village[data$village == "PALATA"] <- "PALATO"
data$village[data$village == "NO2"] <- "NUMBER2"
data$village[data$village == "NO3"] <- "NUMBER3"
data$village[data$village == "NO4"] <- "NUMBER4"
data$village[data$village == "NO5"] <- "NUMBER5"
data$village[data$village == "NO7"] <- "NUMBER7"
data$village[data$village == "NSAMBUZI"] <- "MSAMBUZI"
data$village[data$village == "NSELEMA"] <- "MSELEMA"
data$village[data$village == "NSIKAWANJALA"] <- "MSIKAWANJALA"
data$village[data$village == "NTAMBALIKA"] <- "NTAMBARIKA"
data$village[data$village == "NTANDIZI"] <- "NTHANDIZI"
data$village[data$village == "NTELERA"] <- "MTELERA"
data$village[data$village == "NTENTHE"] <- "NTETHE"
data$village[data$village == "NDIRANDEHILLS"] <- "NDIRANDEHIL"
data$village[data$village == "NEARBALUTI"] <- "BALUTI"
data$village[data$village == "NKOKA"] <- "MKOKA"
data$village[data$village == "NKUWEFA"] <- "NKUWEYA"
data$village[data$village == "NKWATE"] <- "MKWATE"
data$village[data$village == "NAKHOKA"] <- "NANTHOKA"
data$village[data$village == "NAMALO"] <- "NAMALU"
data$village[data$village == "MWINGANYAMA"] <- "MWINANYAMA"
data$village[data$village == "MWAMWADI"] <- "MWAMADI"
data$village[data$village == "MWANCHANDE"] <- "MWACHANDE"
data$village[data$village == "MWAYIWALA"] <- "MWAIWALA"
data$village[data$village == "MTPLEASANT"] <- "MOUNTPLESANT"
data$village[data$village == "MTENDERENEAR"] <- "MTENDERE"
data$village[data$village == "MTHANDIZI"] <- "NTHANDIZI"
data$village[data$village == "MTHUNDU"] <- "THUNDU"
data$village[data$village == "MLUNGUZI"] <- "MULUNGUZIGROUND"
data$village[data$village == "MNONDIWA"] <- "MONDIWA"
data$village[data$village == "MNTHANDIZI"] <- "NTHANDIZI"
data$village[data$village == "MNYAKANEAR"] <- "NYAKA"
data$village[data$village == "MONIWA"] <- "MONDIWA"
data$village[data$village == "MIDZENJE"] <- "MIZENJE"
data$village[data$village == "MILALE"] <- "MILARE"
data$village[data$village == "MINYONGA"] <- "CHINYONGA"
data$village[data$village == "MISEU6"] <- "MISEWU6"
data$village[data$village == "MIYANGA"] <- "NAMIYANGO"
data$village[data$village == "MKAIMBA"] <- "NKAIMBA"
data$village[data$village == "MKHUKUTENI"] <- "NKHUKUTENI"
data$village[data$village == "MKAMBA"] <- "KAMBA"
data$village[data$village == "MKHWATE"] <- "MKWATE"
data$village[data$village == "MKWAPATIRA"] <- "MKWAPATILA"
data$village[data$village == "MBAYA"] <- "MBAYANI"
data$village[data$village == "MBELEWERE"] <- "MBEREWELE"
data$village[data$village == "MBOKOLA"] <- "KUMBOKOOLA"
data$village[data$village == "MBWANA"] <- "M'BWANA"
data$village[data$village == "MBWINJA"] <- "M'BWINJA"
data$village[data$village == "MDAWA"] <- "DAWA"
data$village[data$village == "NANTCHOLI"] <- "NATCHOLI"
data$village[data$village == "MATCHOMBE"] <- "MANTCHOMBE"
data$village[data$village == "MATHUNDI"] <- "THUNDU"
data$village[data$village == "MASAJIRI"] <- "MASAJILI"
data$village[data$village == "MASAME"] <- "SEMU"
data$village[data$village == "MATALA"] <- "MATALALA"
data$village[data$village == "MALESIA"] <- "MALASIA"
data$village[data$village == "MALATA"] <- "GREENMALATA"
data$village[data$village == "MALESYA"] <- "MALASIA"
data$village[data$village == "MALINGAMOYO"] <- "MALUNGAMOYO"
data$village[data$village == "MANCHOMBE"] <- "MANTCHOMBE"
data$village[data$village == "MANDA"] <- "KUMANDA"
data$village[data$village == "MANGU"] <- "MANGO"
data$village[data$village == "MANG`OMA"] <- "MANG'OMA"
data$village[data$village == "MANGOCHI"] <- "MANGOCHIA"
data$village[data$village == "M`BWINJA"] <- "M'BWINJA"
data$village[data$village == "MAGOBODIP"] <- "MAGOMBODIP"
data$village[data$village == "MAJISA"] <- "MAJIGA"
data$village[data$village == "MAGENGA"] <- "MAJIGA"
data$village[data$village == "MAGIGA"] <- "MAJIGA"
data$village[data$village == "MAGISA"] <- "MAJIGA"
data$village[data$village == "MALANJA"] <- "MANJA"
data$village[data$village == "MALABATI"] <- "MALABADA"
data$village[data$village == "LIKHUBULA"] <- "LIKHUBULANEARPACT"
data$village[data$village == "LIRADALA"] <- "LIDALA"
data$village[data$village == "LIVINGWATERS"] <- "CHIMWANKHUNDALIVINGWATERS"
data$village[data$village == "M'BWELERA"] <- "M’BWELERA"
data$village[data$village == "KIMU"] <- "CHEKIMU"
data$village[data$village == "KOLOMBOLA"] <- "KALOMBOLA"
data$village[data$village == "KUMANJE"] <- "MANJE"
data$village[data$village == "KUMWEMBA"] <- "KUMWEMBE"
data$village[data$village == "KUNTAYA"] <- "NTAYA"
data$village[data$village == "KWATEVILLAGE"] <- "MKWATE"
data$village[data$village == "KILK"] <- "CHEKIMU"
data$village[data$village == "KAPENA"] <- "KAPENI"
data$village[data$village == "KAPICHI"] <- "KAPUCHI"
data$village[data$village == "KATSALABANDE"] <- "KASALABANDE"
data$village[data$village == "KALIMIRAMOTO"] <- "KALIMIMOTO"
data$village[data$village == "KALIYATI"] <- "KALIATI"
data$village[data$village == "KAMONDE"] <- "NAMONDE"
data$village[data$village == "KAMTIMBANYA"] <- "KANTIMBANYA"
data$village[data$village == "KANDONJE"] <- "KANDOJE"
data$village[data$village == "KANFUPA"] <- "KAFUPA"
data$village[data$village == "GAYESI"] <- "GAESI"
data$village[data$village == "GEORGE"] <- "GEORGEVILLAGE"
data$village[data$village == "GROLIA"] <- "GLORIA"
data$village[data$village == "JIYA"] <- "NJIYA"
data$village[data$village == "KADAMMANJA"] <- "KADAMANJA"
data$village[data$village == "GAMULA"] <- "GAMULANI"
data$village[data$village == "DZIKUPU"] <- "DZIKUPI"
data$village[data$village == "DELANDE"] <- "DERUNDE"
data$village[data$village == "CHURCH"] <- "ZAMBEZICHURCH"
data$village[data$village == "CHRIRMBA"] <- "CHIRIMBA"
data$village[data$village == "CHOKIM"] <- "CHEKIMU"
data$village[data$village == "CHISA"] <- "CHIMWANKHUNDACHISA"
data$village[data$village == "CHISI"] <- "CHIMWANKHUNDACHISA"
data$village[data$village == "CHISWOGA"] <- "CHISONGA"
data$village[data$village == "CHITAKA"] <- "CHITAKALE"
data$village[data$village == "CHITSA"] <- "CHIMWANKHUNDACHISA"
data$village[data$village == "CHITUPULE"] <- "CHINUPULE,NEARMAKHETHA"
data$village[data$village == "CHINUPULE"] <- "CHINUPULE,NEARMAKHETHA"
data$village[data$village == "CHINUPULENEARMAKHETAMARKETPLOTSAIDI"] <- "CHINUPULE,NEARMAKHETHA"
data$village[data$village == "CHINUPLEVGENEARNDILEKENI"] <- "NDILEKENI"
data$village[data$village == "CHINUPUIE1NEARPHIRI"] <- "CHINUPULE1"
data$village[data$village == "CHINUKULE1NEARSTANCESCHOOL"] <- "CHINUPULE1"
data$village[data$village == "CHINUKULE1NEARMAIRACHIEFHOUSE"] <- "CHINUPULE1"
data$village[data$village == "CHINTUMBIRA"] <- "CHIMTUMBIRA"
data$village[data$village == "CHINTUMBIRE"] <- "CHIMTUMBIRA"
data$village[data$village == "CHINTUBIRA"] <- "CHIMTUMBIRA"
data$village[data$village == "CHINSEUVILLAGE"] <- "CHINSEU"
data$village[data$village == "CHINSEUNEARCHIBUKUDEPORT"] <- "CHINSEUBEHINDTARVEN"
data$village[data$village == "CHINSEUVGENEARLIZEO"] <- "CHINSEU"
data$village[data$village == "CHINSEUNEARLEZEOMARKET"] <- "CHINSEU"
data$village[data$village == "CHINSEUNEARBLM"] <- "CHINSEU"
data$village[data$village == "CHINDEKANEARNURSERY"] <- "CHINDEKA"
data$village[data$village == "CHINDEMU"] <- "CHINDEVU"
data$village[data$village == "CHING`AMBA"] <- "CHING'AMBA"
data$village[data$village == "CHING`AMBANEARBOREHOLE"] <- "CHING'AMBA"
data$village[data$village == "CHING`AMBANEARGVH"] <- "CHING'AMBA"
data$village[data$village == "CHING`AMBANEARNTONDOKO"] <- "CHING'AMBA"
data$village[data$village == "CHING`OMBENEARBOREHOLE"] <- "CHING'OMBE"
data$village[data$village == "CHING`OMBENEARPRIMARYSCHOOL"] <- "CHING'OMBE"
data$village[data$village == "CHING`OMBEVGE"] <- "CHING'OMBE"
data$village[data$village == "CHINGAMBANEARGVHCHINGAMBA"] <- "CHING'AMBA"
data$village[data$village == "CHINGUNKHAPATSOGO"] <- "CHINGUKAPATSOGO"
data$village[data$village == "CHINJINGANTHANDIZI"] <- "NTHANDIZI"
data$village[data$village == "CHILUNDUKA"] <- "CHILUNDUKAA"
data$village[data$village == "CHIMANDA"] <- "KUMANDA"
data$village[data$village == "CHIMKANDE"] <- "CHIMKANDA"
data$village[data$village == "CHIMKWINJA"] <- "MAKWINJA"
data$village[data$village == "CHIMOWA"] <- "KAMOWA"
data$village[data$village == "CHIMWAMALINGAMOYO"] <- "MALUNGAMOYO"
data$village[data$village == "CHIMWANKHUNDAMALINGAMOYO"] <- "MALUNGAMOYO"
data$village[data$village == "CHIMWANKHUDA"] <- "CHIMWANKHUNDA"
data$village[data$village == "CHIMWANKHUNDANEARDAM"] <- "CHIMWAKHUNDADAM"
data$village[data$village == "CHIMWANKHUNDADECCHITSA"] <- "CHIMWANKHUNDACHISA"
data$village[data$village == "CHINDEKANEARNURSERY"] <- "CHINDEKA"
data$village[data$village == "CHILAULO"] <- "CHILAURO"
data$village[data$village == "CHIIMIRE"] <- "CHIIMILE"
data$village[data$village == "ATMILARESCHOOL"] <- "MILAREATXUL"
data$village[data$village == "BAYANI"] <- "MBAYANI"
data$village[data$village == "BIBAKANTUKULE"] <- "KANTUKULE"
data$village[data$village == "BVA"] <- "BCA"
data$village[data$village == "CAVARYFAMILYCHURCH"] <- "CALVARYFAMILYCHURCH"
data$village[data$village == "CHAKANIKA"] <- "CHAKANA"
data$village[data$village == "CHANGWIRA"] <- "CHAGWIRAUTA"
data$village[data$village == "CHAVALA"] <- "CHABVALA"
data$village[data$village == "CHEMALUWA"] <- "MALUWA"
data$village[data$village == "CHEMUJA"] <- "CHEMUSA"
data$village[data$village == "CHESOMBA"] <- "SOMBA"
data$village[data$village == "CHENSOMBA"] <- "SOMBA"
data$village[data$village == "NANCHOLI"] <- "NATCHOLI"
data$village[data$village == "NDIRANDEHIL"] <- "NDILANDEHIL"
data$village[data$village == "MJAMBE"] <- "NJAMBA"
data$village[data$village == "KANUNKHAPHIRI"] <- "KANUNKHAMPINI"
data$village[data$village == "CHILORE"] <- "CHILOBWE"
data$village[data$village == "CHIKIWA"] <- "CHEKIMU"
data$village[data$village == "CHAUNJE"] <- "CHAWANJE"
data$village[data$village == "ESAYA"] <- "YESAYA"
data$village[data$village == "MASINDA"] <- "MASINDE"
data$village[data$village == "MISINDE"] <- "MASINDE"
data$village[data$village == "MMANGANI"] <- "MMANGENI"
data$village[data$village == "UZI"] <- "CHEUZI"
data$village[data$village == "MOYA"] <- "CHEMOYA"
data$village[data$village == "CHITHA"] <- "CHATHA"
data$village[data$village == "CHIHERE"] <- "CHIWERE"
data$village[data$village == "MATAKA"] <- "MAKATA"
data$village[data$village == "GAMULA"] <- "GAMULANI"
data$village[data$village == "CHAKANIKA"] <- "CHAKANA"
data$village[data$village == "NKHONO"] <- "KHOKO"
data$village[data$village == "ZANYEMBA"] <- "ZAMANEMBA"
data$village[data$village == "YALIWA"] <- "NALIWA"
data$village[data$village == "MATHYOWA"] <- "MATCHOWA"
data$village[data$village == "MBUZI"] <- "MBOZI"
data$village[data$village == "MPWINYIRA"] <- "PWINYIZA"
data$village[data$village == "MPHWINIZA"] <- "PWINYIZA"
data$village[data$village == "KHUMBANYIWA"] <- "MANEYA"
data$village[data$village == "CHASWANTHA"] <- "CHASANTHAKA"
data$village[data$village == "CHIMPANJE"] <- "CHIMPANGO"
data$village[data$village == "MKUNJE"] <- "MAKUNJE"
data$village[data$village == "CHILEMBE"] <- "CHILEMBWE"
data$village[data$village == "CCAPBOREHORE"] <- "MAKALANI"
data$village[data$village == "MALENGA"] <- "MULENGA"
data$village[data$village == "MALEYA"] <- "MALEKWA"
data$village[data$village == "BALEYA"] <- "BULEYA"
data$village[data$village == "MZITO"] <- "NZITO"
data$village[data$village == "MSITO"] <- "NZITO"
data$village[data$village == "NTUTA"] <- "MTUTA"
data$village[data$village == "NGOGOLO"] <- "NDOGOLO"
data$village[data$village == "MBAMBALA"] <- "PHAMBALA"
data$village[data$village == "MOLEKWA"] <- "MALEKWA"
data$village[data$village == "MBAMA"] <- "MBOMA"
data$village[data$village == "MATLAS"] <- "MATALALA"
data$village[data$village == "CHIMATA"] <- "CHIMALA"
data$village[data$village == "CHAUNJE"] <- "CHAWANJE"
data$village[data$village == "CHEMBOMA"] <- "CHIBONA"
data$village[data$village == "CHIWERE"] <- "CHIWEMBE"
data$village[data$village == "CHOKIM"] <- "CHEKIMU"
data$village[data$village == "KIMU"] <- "CHEKIMU"
data$village[data$village == "KUMWAMBE"] <- "KUMWEMBE"
data$village[data$village == "KUMWEMBA"] <- "KUMWEMBE"
data$village[data$village == "MATALA"] <- "MATALALA"
data$village[data$village == "MLESO"] <- "MULESO"
data$village[data$village == "QUARRY"] <- "SOCHEQUARRY"
data$village[data$village == "QURRY"] <- "SOCHEQUARRY"
data$village[data$village == "SIMON"] <- "SIMONMTAMBO"
data$village[data$village == "MTAMBO"] <- "SIMONMTAMBO"
data$village[data$village == "KUTCHIRE"] <- "KUTCHILI"
data$village[data$village == "NKUMBA"] <- "MKUMBA"
data$village[data$village == "ZANGANGUWO"] <- "ZINGANGUWO"
data$village[data$village == "JEWETANEAR"] <- "JEWETA1"
data$village[data$village == "NAMONDA"] <- "NAMONDE"
data$village[data$village == "GOMBA"] <- "GOMBE"
data$village[data$village == "CHIMKANDE"] <- "CHIMKANDA"
data$village[data$village == "CHINDEMU"] <- "CHINDEBVU"
data$village[data$village == "CHINTUMBIRE"] <- "CHINTUMBIRA"
data$village[data$village == "MAGOMBODIP"] <- "MAGOMBO"
data$village[data$village == "MALENGU"] <- "MULENGA"
data$village[data$village == "MALEYA"] <- "MALIYA"
data$village[data$village == "MTIMA"] <- "MTIZA"
data$village[data$village == "NKUWEFA"] <- "NKUWEYA"
data$village[data$village == "MPHEMBU"] <- "MPEMBU"
data$village[data$village == "MAPLOT"] <- "GOLIRO"
data$village[data$village == "MAPUTO"] <- "GOLIRO"
data$village[data$village == "CHAKANIKA"] <- "CHAKANA"
data$village[data$village == "GAMULA"] <- "GAMULANI"
data$village[data$village == "MALIGA"] <- "MAJIGA"
data$village[data$village == "MAGIGA"] <- "MAJIGA"
data$village[data$village == "MAGISA"] <- "MAJIGA"
data$village[data$village == "MAHATA"] <- "GREENMALATA"
data$village[data$village == "CHAKAWA"] <- "CHAKANA"
data$village[data$village == "MAJISA"] <- "MAJIGA"
data$village[data$village == "MBEMBUBASAYAPLOT"] <- "MPEMBU"
data$village[data$village == "MALABATI"] <- "MALABADA"
data$village[data$village == "MUNAPA"] <- "NAMATAPA"
data$village[data$village == "MSIKI"] <- "WISIKIBISANI"
data$village[data$village == "MWANJIRA"] <- "GOMANJIRA"
data$village[data$village == "NGOMANJIRA"] <- "GOMANJIRA"
data$village[data$village == "NKOMANJIRA"] <- "GOMANJIRA"
data$village[data$village == "CHEUCHEU"] <- "CHEUZI"
data$village[data$village == "ESAYA"] <- "YESAYA"
data$village[data$village == "KUBANO"] <- "KABANO"
data$village[data$village == "MASINDA"] <- "MASINDE"
data$village[data$village == "MISINDE"] <- "MASINDE"
data$village[data$village == "MMANGANI"] <- "MMANGENI"
data$village[data$village == "UZI"] <- "CHEUZI"
data$village[data$village == "FASANINEARJECOM"] <- "PASANI"
data$village[data$village == "MSAYANI"] <- "MBAYANI"
data$village[data$village == "CHIGONEKA"] <- "CHIGONAWAYA"
data$village[data$village == "PHWINYILA"] <- "PHWINYIZA"
data$village[data$village == "CHIDZOLA"] <- "CHOZOLA"
data$village[data$village == "DEBERE"] <- "MBEMBELE"
data$village[data$village == "KUDOMWE"] <- "DOMWE"
data$village[data$village == "KWANTOCHA"] <- "NTOCHA"
data$village[data$village == "MACHIZA"] <- "MACHILA"
data$village[data$village == "MASENDANAN"] <- "MASELEMA"
data$village[data$village == "MATATA"] <- "MAKATA"
data$village[data$village == "NAKAYA"] <- "STAYA"
data$village[data$village == "RNSAMBANI"] <- "RNSAMBUZI"
data$village[data$village == "SUMANJE"] <- "SOMANJE"
data$village[data$village == "WENERA"] <- "WENELA"
data$village[data$village == "NANCHOII"] <- "NANCHOLI"
data$village[data$village == "NANCHOLO"] <- "NANCHOLI"
data$village[data$village == "UNDERSON"] <- "ANDERSON"
data$village[data$village == "NG'OMBAERA"] <- "NG'OMBERA"
data$village[data$village == "BSS"] <- "BLANTYRESEC.SCHOOL"
data$village[data$village == "CHIMSEWU"] <- "CHINSEU"
data$village[data$village == "CHINIKULE1,NEARSTANCESCHOOL"] <- "CHINUKULE1NEARSTANCESCHOOL"
data$village[data$village == "CHIROBWE"] <- "CHILOBWE"
data$village[data$village == "CHIROMONI"] <- "CHILOMONI"
data$village[data$village == "GRORIA"] <- "GLORIA"
data$village[data$village == "MDALAA"] <- "MDALA"
data$village[data$village == "MBEREWELE"] <- "MBELEWELE"
data$village[data$village == "MOLOSONI"] <- "MOLOSON"
data$village[data$village == "MLWAPATIRA"] <- "MKWAPATILA"
data$village[data$village == "N'GOMBERA"] <- "NG'OMBERA"
data$village[data$village == "NATCHOLI"] <- "NANCHOLI"
data$village[data$village == "NJIRIKA"] <- "NJILIKA"
data$village[data$village == "CHIMKANDA"] <- "CHINKANDA"
data$village[data$village == "NDARAMA"] <- "NDALAMA"
data$village[data$village == "POSTIMASULANI"] <- "POSTMASULANI"
data$village[data$village == "CHIMBONANA"] <- "CHEMBONA"
data$village[data$village == "MMADI"] <- "CHEMMADI"
data$village[data$village == "CHIRAMBE"] <- "CHILAMBE"
data$village[data$village == "CHILUNDUKAA"] <- "CHILUNDUKA"
data$village[data$village == "MGANGALA"] <- "GANGALA"
data$village[data$village == "MGOMANJIRA"] <- "GOMANJIRA"
data$village[data$village == "KANTUKULE"] <- "KAMTUKULE"
data$village[data$village == "KAPHIKAMTAMA"] <- "KAPHIKANTAMA"
data$village[data$village == "LIPUGAMA"] <- "LIPUNGAMA"
data$village[data$village == "LISAGWI"] <- "LISANGWI"
data$village[data$village == "MALONGA1"] <- "MALONGA"
data$village[data$village == "CHEMUSAM'BWERELA"] <- "M`BWELERA"
data$village[data$village == "MALIYA"] <- "MARIA"
data$village[data$village == "MBEREWELE"] <- "MBELEWERE"
data$village[data$village == "MGOMANJIRA"] <- "MG`OMANJIRA"
data$village[data$village == "NKUNG'UNDA"] <- "MKUNG`UNDA"
data$village[data$village == "MANGO"] <- "MMANGO"
data$village[data$village == "MGOMANJIRA"] <- "MNGOMANJIRA"
data$village[data$village == "NATCHOLI"] <- "NANCHOLI"
data$village[data$village == "NANGUMI"] <- "NANGUNI"
data$village[data$village == "NAZERENE"] <- "NAZARENE"
data$village[data$village == "NDARAMA"] <- "NDALAMA"
data$village[data$village == "N'GOMBERA"] <- "NG'OMBERA"
data$village[data$village == "KWAAGAMA"] <- "GAMA"
data$village[data$village == "SAIKONDI"] <- "SAIKONDE"
data$village[data$village == "STLUOIS"] <- "STLOUIS"
data$village[data$village == "POSTIMASULANI"] <- "POSTMASULANI"
data$village[data$village == "TUNG'ANDE"] <- "TUNG`ANDEMDALA"
data$village[data$village == "WISIKI"] <- "WISIKIBISANI"
data$village[data$village == "MALUNGAA"] <- "MALUNGA"
data$village[data$village == "CHIGUMULA1"] <- "CHIGUMULA"
data$village[data$village == "WISIKIBISANI"] <- "WISIKI"
data$village[data$village == "PENSULO2A"] <- "PENSULO"
data$village[data$village == "MKUNG`UNDA"] <- "NKUNG'UNDA"


data$village = as.factor(data$village)
levels(data$village)

data = data[,c("village", "health_facility", "geometry")]

data=st_zm(data)

#write_csv(data,"intermediaries/kobo_vil.csv")


###Grouping villages by health facility
ameca_chilaweni_vi  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "AMECA/CHILAWENI")

bangwe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "BANGWE")%>%
  distinct(village, health_facility, .keep_all = TRUE)
  
chavala_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHABVALA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chikowa_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHIKOWA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chileka_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHILEKA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chilekasda_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHILEKA SDA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chilomoni_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHILOMONI")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chimembe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHIMEMBE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chirimba_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "CHIRIMBA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

dziwe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "DZIWE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

chichi_lighth_gateway_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "GATEWAY" | health_facility == "LIGHT HOUSE" |health_facility == "CHICHIRI PRISON" )%>%
  distinct(village, health_facility, .keep_all = TRUE)

kachere_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "KACHERE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

kadidi_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "KADIDI")%>%
  distinct(village, health_facility, .keep_all = TRUE)

khungulu_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "KHUNGULU")%>%
  distinct(village, health_facility, .keep_all = TRUE)

limbe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LIMBE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

lirangwe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LIRANGWE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

lundu_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LUNDU")%>%
  distinct(village, health_facility, .keep_all = TRUE)

madziabango_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MADZIABANGO")%>%
  distinct(village, health_facility, .keep_all = TRUE)

makata_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MAKATA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

makhetha_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MAKHETHA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

mbayani_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MBAYANI")%>%
  distinct(village, health_facility, .keep_all = TRUE)

mdeka_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MDEKA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

mlambe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MLAMBE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

mpemba_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MPEMBA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

mpingo_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "MPINGO")%>%
  distinct(village, health_facility, .keep_all = TRUE)

namikoko_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "NAMIKOKO")%>%
  distinct(village, health_facility, .keep_all = TRUE)

ndirande_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "NDIRANDE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

pensulo_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "PENSULO")%>%
  distinct(village, health_facility, .keep_all = TRUE)

limbe_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "LIMBE")%>%
  distinct(village, health_facility, .keep_all = TRUE)

sochematernity_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "SOCHEMATERNITY")%>%
  distinct(village, health_facility, .keep_all = TRUE)

southlunzu_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "SOUTH LUNZU")%>%
  distinct(village, health_facility, .keep_all = TRUE)

stvin_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "ST. VINCENT")%>%
  distinct(village, health_facility, .keep_all = TRUE)

zingwangwa_vil  <- data %>% 
  group_by(health_facility) %>% 
  filter(health_facility == "ZINGWANGWA")%>%
  distinct(village, health_facility, .keep_all = TRUE)

############################################
##Merging cases and villages by location

ameca_geom <- merge(ameca_chilaweni, ameca_chilaweni_vi[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

bangwe_geom <- merge(bangwe, bangwe_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

#bangwe_geom <- merge(bangwe_geom, limbe_vil[, "village", drop = FALSE],
                     #by = "village", all.x = TRUE)
  

chavala_geom <- merge(chavala, chavala_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

chichiri_prison_geom <- merge(chichiri_prison, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)

  
chikowa_geom <- merge(chikowa, chikowa_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)  

chileka_geom <- merge(chileka, chileka_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)

chilomoni_geom <- merge(chilomoni, chilomoni_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)

chimembe_geom <- merge(chimembe, chimembe_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)

chirimba_geom <- merge(chirimba, chirimba_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)

dziwe_geom <- merge(dziwe, dziwe_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)

gateway_geom <- merge(gateway, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

kachere_geom <- merge(kachere, kachere_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

kadidi_geom <- merge(kadidi, kadidi_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

lighth_geom <- merge(lighthouse, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

limbe_geom <- merge(limbe, limbe_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

lirangwe_geom <- merge(lirangwe, lirangwe_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

lundu_geom <- merge(lundu, lundu_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

madziabango_geom <- merge(madziabango, madziabango_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

makata_geom <- merge(makata, makata_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

makhetha_geom <- merge(makhetha, makhetha_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

mbayani_geom <- merge(mbayani, mbayani_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

mdeka_geom <- merge(mdeka, mdeka_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

mlambe_geom <- merge(mlambe, mlambe_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

mpemba_geom <- merge(mpemba, mpemba_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

mubas_geom <- merge(mubas, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)


namikoko_geom <- merge(namikoko, namikoko_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

ndirande_geom <- merge(ndirande, ndirande_vil[, "village", drop = FALSE], 
                       by = "village", all.x = TRUE)

qech_geom <- merge(qech, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                       by = "village", all.x = TRUE)


sochematernity_geom <- merge(sochematernity, sochematernity_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

southlunzu_geom <- merge(southlunzu, southlunzu_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

zingwangwa_geom <- merge(zingwangwa, zingwangwa_vil[, "village", drop = FALSE], 
                    by = "village", all.x = TRUE)

########################################################
#additional merging based on how data was collected
#Bangwe
bangwe_geom2 <- bangwe_geom %>%
  filter(!st_is_empty(bangwe_geom$geometry))


bangwe_geom3 <- bangwe_geom %>%
  filter(st_is_empty(bangwe_geom$geometry))%>%
  select(-geometry)

bangwe_geom3<- merge(bangwe_geom3, limbe_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)


#joining two data sets of bangwe together
bangwe_geom <- rbind(bangwe_geom2, bangwe_geom3)

#Chileka
chileka_geom2 <- chileka_geom %>%
  filter(!st_is_empty(chileka_geom$geometry))


chileka_geom3 <- chileka_geom %>%
  filter(st_is_empty(chileka_geom$geometry))%>%
  select(-geometry)

chileka_geom3<- merge(chileka_geom3, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)


#joining two data sets of chileka together
chileka_geom <- rbind(chileka_geom2, chileka_geom3)

#chilomoni
chilomoni_geom2 <- chilomoni_geom %>%
  filter(!st_is_empty(chilomoni_geom$geometry))


chilomoni_geom3 <- chilomoni_geom %>%
  filter(st_is_empty(chilomoni_geom$geometry))%>%
  select(-geometry)

chilomoni_geom3<- merge(chilomoni_geom3, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                      by = "village", all.x = TRUE)


#joining two data sets of chilomoni together
chilomoni_geom <- rbind(chilomoni_geom2, chilomoni_geom3)


#zingwangwa
zingwangwa_geom2 <- zingwangwa_geom %>%
  filter(!st_is_empty(zingwangwa_geom$geometry))


zingwangwa_geom3 <- zingwangwa_geom %>%
  filter(st_is_empty(zingwangwa_geom$geometry))%>%
  select(-geometry)

zingwangwa_geom3<- merge(zingwangwa_geom3, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                      by = "village", all.x = TRUE)


#joining two data sets of zingwangwa together
zingwangwa_geom <- rbind(zingwangwa_geom2, zingwangwa_geom3)

#southlunzu
southlunzu_geom2 <- southlunzu_geom %>%
  filter(!st_is_empty(southlunzu_geom$geometry))


southlunzu_geom3 <- southlunzu_geom %>%
  filter(st_is_empty(southlunzu_geom$geometry))%>%
  select(-geometry)

southlunzu_geom3<- merge(southlunzu_geom3, limbe_vil[, "village", drop = FALSE], 
                         by = "village", all.x = TRUE)


#joining two data sets of southlunzu together
southlunzu_geom <- rbind(southlunzu_geom2, southlunzu_geom3)

#ndirande
ndirande_geom2 <- ndirande_geom %>%
  filter(!st_is_empty(ndirande_geom$geometry))


ndirande_geom3 <- ndirande_geom %>%
  filter(st_is_empty(ndirande_geom$geometry))%>%
  select(-geometry)

ndirande_geom3<- merge(ndirande_geom3, limbe_vil[, "village", drop = FALSE], 
                         by = "village", all.x = TRUE)


#joining two data sets of ndirande together
ndirande_geom <- rbind(ndirande_geom2, ndirande_geom3)

#mbayani
mbayani_geom2 <- mbayani_geom %>%
  filter(!st_is_empty(mbayani_geom$geometry))


mbayani_geom3 <- mbayani_geom %>%
  filter(st_is_empty(mbayani_geom$geometry))%>%
  select(-geometry)

mbayani_geom3<- merge(mbayani_geom3, chichi_lighth_gateway_vil[, "village", drop = FALSE], 
                         by = "village", all.x = TRUE)


#joining two data sets of mbayani together
mbayani_geom <- rbind(mbayani_geom2, mbayani_geom3)


#Ameca
ameca_geom2 <- ameca_geom %>%
  filter(!st_is_empty(ameca_geom$geometry))


ameca_geom3 <- ameca_geom %>%
  filter(st_is_empty(ameca_geom$geometry))%>%
  select(-geometry)

ameca_geom3<- merge(ameca_geom3, southlunzu_vil[, "village", drop = FALSE], 
                      by = "village", all.x = TRUE)


#joining two data sets of ameca together
ameca_geom <- rbind(ameca_geom2, ameca_geom3)

#limbe
limbe_geom2 <- limbe_geom %>%
  filter(!st_is_empty(limbe_geom$geometry))


limbe_geom3 <- limbe_geom %>%
  filter(st_is_empty(limbe_geom$geometry))%>%
  select(-geometry)

limbe_geom3<- merge(limbe_geom3, bangwe_vil[, "village", drop = FALSE], 
                     by = "village", all.x = TRUE)


#joining two data sets of limbe together
limbe_geom <- rbind(limbe_geom2, limbe_geom3)


####
#Joining all datasets together
Chol_cases_vil <- list(ameca_geom, bangwe_geom,chavala_geom, chichiri_prison_geom, chikowa_geom,
                       chileka_geom,chilomoni_geom,chimembe_geom,chirimba_geom,dziwe_geom,gateway_geom,
                       kachere_geom, kadidi_geom,lighth_geom,limbe_geom,lirangwe_geom,lundu_geom,madziabango_geom,
                       makata_geom,makhetha_geom,mbayani_geom,mdeka_geom,mlambe_geom,mpemba_geom,namikoko_geom,
                       ndirande_geom,sochematernity_geom,southlunzu_geom,zingwangwa_geom,mubas_geom,
                       qech_geom)


# Join the dataframes along the rows
chol_cases_vil_geom <- bind_rows(Chol_cases_vil)

#Extracting villages which didnt join

chol_cases_vil_geom2 <- chol_cases_vil_geom %>%
  filter(!st_is_empty(chol_cases_vil_geom$geometry))


chol_cases_vil_geom3 <- chol_cases_vil_geom %>%
  filter(st_is_empty(chol_cases_vil_geom$geometry))%>%
  select(-geometry)  #This will be merged with the combined dataset of villages collected

#########################################################################################

#----------------------NSO--------------------------------------#

#----capitalizing village and health facility names-----#
nso$NAME <- toupper(nso$NAME)

colnames(nso)[colnames(nso)=="NAME"] = "village"

#-----Removing spaces for easy matching data-------#
nso$village = paste0(gsub("\\s+", "", nso$village))
nso$village = as.factor(nso$village)
levels(nso$village)

nso = nso[,c("village", "the_geom")]
colnames(nso)[colnames(nso)=="the_geom"] = "geometry"


#-----Editing names (spelling)
nso$village = as.character(nso$village)

nso$village[nso$village == "ADAMU"] <- "ADAM"
nso$village[nso$village == "BEN"] <- "BENI"
nso$village[nso$village == "CHING`OMBE"] <- "CHING'OMBE"
nso$village[nso$village == "MACHIRA"] <- "MACHILA"
nso$village[nso$village == "M`MAMBO"] <- "MAMBO"
nso$village[nso$village == "M'MANGENI"] <- "MMANGENI"
nso$village[nso$village == "M'MANGA"] <- "MMANGA"
nso$village[nso$village == "M'GAMBO"] <- "MMGAMBO"
nso$village[nso$village == "M`MANGENI"] <- "MMANGENI"
nso$village[nso$village == "MSAMBUDZI"] <- "MSAMBUZI"
nso$village[nso$village == "SEMIONMTAMBO"] <- "SIMONMTAMBO"
nso$village[nso$village == "KUCHIRI"] <- "KUTCHILI"
nso$village[nso$village == "MTOCHA"] <- "NTOCHA"
nso$village[nso$village == "MTENJE"] <- "NTENJE"
nso$village[nso$village == "KAJAO"] <- "KAJAWO"
nso$village[nso$village == "KANINGA"] <- "KANING'A"
nso$village[nso$village == "CHIMBONA"] <- "CHEMBONA"
nso$village[nso$village == "PENSULO"] <- "CHILINGENIPENSULO"
nso$village[nso$village == "PENSULO"] <- "CHABWERA,PENSULO"
nso$village[nso$village == "KALOLO"] <- "LOLO"
nso$village[nso$village == "MACHINJILI"] <- "MACHINJIRI"
nso$village[nso$village == "MACHOWA"] <- "MACHOWE"
nso$village[nso$village == "MWAZANGA"] <- "MWAZANGATI"
nso$village[nso$village == "MKAWINDA"] <- "NKAWINDA"
nso$village[nso$village == "KAPHIKAMTAMA"] <- "KAPHIKANTAMA"


#--------END

#------Merging dataset----------------#

#write_csv(nso,"intermediaries/nsofile.csv")

#write_csv(data,"intermediaries/datafile.csv")
#write_csv(data,"intermediaries/datafile2.csv")

#merged =read_sf("../../../../../../GIS_Folder/Vector/Malawi/Blantyre/inputs/locations/merged_locations.shp")
#merged =read_sf("../../../../../Vector/Malawi/Blantyre/inputs/locations/merged_locations.shp")
merged =read_sf("intermediaries/QGIS/inputs/locations/merged_locations.shp")

merged2=distinct(merged,village, .keep_all = TRUE) %>% 
  select(village,geometry)

#writing villages
#write_sf(merged2,"intermediaries/residential areas.geojson")


#merging this to the cholera dataset which does not have geom points

chol_cases_vil_geom4 <- merge(chol_cases_vil_geom3, merged2[, "village", drop = FALSE], 
                        by = "village", all.x = TRUE)


##COMBINING DATASETS FOR DASHBOARD
cholera_cases <- rbind(chol_cases_vil_geom2,chol_cases_vil_geom4)
cholera_cases$village = as.factor(cholera_cases$village)
levels(cholera_cases$village)

#Differentiating mbayani from Bangwe/limbe side and mbayani/chirimba side
# Identify the target health facilities

# Conditionally rename "mbayani" in "village" based on health facility
cholera_cases$village = as.character(cholera_cases$village)
cholera_cases$health_facility = as.character(cholera_cases$health_facility)
str(cholera_cases)

cholera_cases <- cholera_cases %>%
  group_by(health_facility) %>%
  mutate(village = ifelse(village == "MBAYANI" & health_facility %in% c("BANGWE", "LIMBE", "SOUTHLUNZU", "NDIRANDE"), "MBAYANI(BANGWE)", village)) %>%
  ungroup()

#write_sf(cholera_cases, "intermediaries/cholera_cases_.geojson")
write_csv(cholera_cases, "intermediaries/cholera_cases_.csv")

# Summarise for a basic dashboard
cholera_cases_summaries <- cholera_cases %>%
  group_by(village) %>% 
  summarise(cases=n())

#Extracting coordinates and villages from cholera_cases file
vil_geom <- cholera_cases %>% 
  select(village, geometry)



dataset_cholera_cases =left_join(cholera_cases_summaries, vil_geom, by = "village")

#cases <- merge(cholera_cases_summaries, vil_geom[, "village", drop = FALSE],
               #by = "village", all.x = TRUE)


#dataset_loc = dataset_location[,c("village", "cases", "geometry")]
write_sf(dataset_cholera_cases, "intermediaries/cholera_case_visualization.geojson")

#write_csv(location,"intermediaries/cases_cholera.csv")

#write_sf(location,"intermediaries/cases_cholera.shp")

########################################################################################
