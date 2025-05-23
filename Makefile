# ****************************************************************************
#    Ledger App Bitcoin
#    (c) 2023 Ledger SAS.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
# ****************************************************************************

########################################
#        Mandatory configuration       #
########################################

# Application version
APPVERSION_M = 2
APPVERSION_N = 4
APPVERSION_P = 7

APPDEVELOPPER="Ledger"
APPCOPYRIGHT="(c) 2024 Ledger"

VARIANT_VALUES = bitcoin_testnet_legacy bitcoin_legacy bitcoin_cash bitcoin_gold litecoin dogecoin dash horizen komodo stratis peercoin pivx viacoin vertcoin digibyte bitcoin_private firo gamecredits zclassic nix lbry ravencoin hydra hydra_testnet xrhodium pepecoin

# Application source files
# There is no additional sources for bitcoin
#APP_SOURCE_PATH += src/

# simplify for tests
ifndef COIN
COIN=pepecoin
endif

# Enabling DEBUG flag will enable PRINTF and disable optimizations
#DEBUG = 1

ifeq ($(COIN),bitcoin_testnet_legacy)
BIP44_COIN_TYPE=1
BIP44_COIN_TYPE_2=1
COIN_P2PKH_VERSION=111
COIN_P2SH_VERSION=196
COIN_FAMILY=1
COIN_COINID=\"Bitcoin\"
COIN_COINID_NAME="Bitcoin Test"
COIN_COINID_SHORT=\"TEST\" 
COIN_NATIVE_SEGWIT_PREFIX=\"tb\" 
COIN_KIND=COIN_KIND_BITCOIN_TESTNET 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Bitcoin Test Legacy"

else ifeq ($(COIN),bitcoin_legacy)
# Horizen
BIP44_COIN_TYPE=0 
BIP44_COIN_TYPE_2=0 
COIN_P2PKH_VERSION=0 
COIN_P2SH_VERSION=5 
COIN_FAMILY=1 
COIN_COINID=\"Bitcoin\" 
COIN_COINID_NAME="Bitcoin"
COIN_COINID_SHORT=\"BTC\" 
COIN_NATIVE_SEGWIT_PREFIX=\"bc\" 
COIN_KIND=COIN_KIND_BITCOIN 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Bitcoin Legacy"

else ifeq ($(COIN),bitcoin_cash)
# Bitcoin cash
# Initial fork from Bitcoin, public key access is authorized. Signature is different thanks to the forkId
BIP44_COIN_TYPE=145 
BIP44_COIN_TYPE_2=0 
COIN_P2PKH_VERSION=0 
COIN_P2SH_VERSION=5 
COIN_FAMILY=1 
COIN_COINID=\"Bitcoin\" 
COIN_COINID_NAME="Bitcoin Cash"
COIN_COINID_SHORT=\"BCH\" 
COIN_KIND=COIN_KIND_BITCOIN_CASH 
COIN_FORKID=0
APPNAME ="Bitcoin Cash"

else ifeq ($(COIN),bitcoin_gold)
# Bitcoin Gold
# Initial fork from Bitcoin, public key access is authorized. Signature is different thanks to the forkId
BIP44_COIN_TYPE=156 
BIP44_COIN_TYPE_2=0 
COIN_P2PKH_VERSION=38 
COIN_P2SH_VERSION=23 
COIN_FAMILY=1 
COIN_COINID=\"Bitcoin\\x20Gold\" 
COIN_COINID_NAME="Bitcoin Gold"
COIN_COINID_SHORT=\"BTG\" 
COIN_KIND=COIN_KIND_BITCOIN_GOLD 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT 
COIN_FORKID=79
APPNAME ="Bitcoin Gold"

else ifeq ($(COIN),litecoin)
# Litecoin
BIP44_COIN_TYPE=2 
BIP44_COIN_TYPE_2=2 
COIN_P2PKH_VERSION=48 
COIN_P2SH_VERSION=50 
COIN_FAMILY=1 
COIN_COINID=\"Litecoin\" 
COIN_COINID_NAME="Litecoin"
COIN_COINID_SHORT=\"LTC\" 
COIN_NATIVE_SEGWIT_PREFIX=\"ltc\" 
COIN_KIND=COIN_KIND_LITECOIN 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Litecoin"

else ifeq ($(COIN),dogecoin)
# Doge
BIP44_COIN_TYPE=3 
BIP44_COIN_TYPE_2=3 
COIN_P2PKH_VERSION=30 
COIN_P2SH_VERSION=22 
COIN_FAMILY=1 
COIN_COINID=\"Dogecoin\" 
COIN_COINID_NAME="Doge"
COIN_COINID_SHORT=\"DOGE\" 
COIN_KIND=COIN_KIND_DOGE
APPNAME ="Dogecoin"

else ifeq ($(COIN),dash)
# Dash
BIP44_COIN_TYPE=5 
BIP44_COIN_TYPE_2=5 
COIN_P2PKH_VERSION=76 
COIN_P2SH_VERSION=16 
COIN_FAMILY=1 
COIN_COINID=\"DarkCoin\" 
COIN_COINID_NAME="Dash"
COIN_COINID_SHORT=\"DASH\" 
COIN_KIND=COIN_KIND_DASH
APPNAME ="Dash"

else ifeq ($(COIN),zcash)
# Zcash (deprecated, code before the NU5 hard fork)
$(error the zcash variant is deprecated and no longer functional since the NU5 hard fork)
BIP44_COIN_TYPE=133 
BIP44_COIN_TYPE_2=133 
COIN_P2PKH_VERSION=7352 
COIN_P2SH_VERSION=7357 
COIN_FAMILY=1 
COIN_COINID=\"Zcash\" 
COIN_COINID_NAME="Zcash"
COIN_COINID_SHORT=\"ZEC\" 
COIN_KIND=COIN_KIND_ZCASH
# Switch to Canopy over Heartwood
BRANCH_ID=0xE9FF75A6
APPNAME ="Zcash"

else ifeq ($(COIN),horizen)
# Horizen
BIP44_COIN_TYPE=121 
BIP44_COIN_TYPE_2=121 
COIN_P2PKH_VERSION=8329 
COIN_P2SH_VERSION=8342 
COIN_FAMILY=4 
COIN_COINID=\"Horizen\" 
COIN_COINID_NAME="Horizen"
COIN_COINID_SHORT=\"ZEN\" 
COIN_KIND=COIN_KIND_HORIZEN
APPNAME ="Horizen"

else ifeq ($(COIN),komodo)
# Komodo
BIP44_COIN_TYPE=141 
BIP44_COIN_TYPE_2=141 
COIN_P2PKH_VERSION=60 
COIN_P2SH_VERSION=85 
COIN_FAMILY=1 
COIN_COINID=\"Komodo\" 
COIN_COINID_NAME="Komodo"
COIN_COINID_SHORT=\"KMD\" 
COIN_KIND=COIN_KIND_KOMODO
APPNAME ="Komodo"

else ifeq ($(COIN),stratis)
# Stratis
BIP44_COIN_TYPE=105105 
BIP44_COIN_TYPE_2=105105 
COIN_P2PKH_VERSION=75 
COIN_P2SH_VERSION=140 
COIN_FAMILY=2 
COIN_COINID=\"Stratis\" 
COIN_COINID_NAME="Stratis"
COIN_COINID_SHORT=\"STRAX\" 
COIN_KIND=COIN_KIND_STRATIS 
COIN_FLAGS=FLAG_PEERCOIN_SUPPORT
APPNAME ="Stratis"

else ifeq ($(COIN),xrhodium)
#Xrhodium
BIP44_COIN_TYPE=10291 
BIP44_COIN_TYPE_2=10291 
COIN_P2PKH_VERSION=61 
COIN_P2SH_VERSION=123 
COIN_FAMILY=1 
COIN_COINID=\"xrhodium\" 
COIN_COINID_NAME="xRhodium"
COIN_COINID_SHORT=\"XRC\" 
COIN_KIND=COIN_KIND_XRHODIUM
APPNAME ="xRhodium"

else ifeq ($(COIN),peercoin)
# Peercoin
BIP44_COIN_TYPE=6 
BIP44_COIN_TYPE_2=6 
COIN_P2PKH_VERSION=55 
COIN_P2SH_VERSION=117 
COIN_FAMILY=2 
COIN_COINID=\"PPCoin\" 
COIN_COINID_NAME="Peercoin"
COIN_COINID_SHORT=\"PPC\" 
COIN_KIND=COIN_KIND_PEERCOIN 
COIN_FLAGS=FLAG_PEERCOIN_UNITS\|FLAG_PEERCOIN_SUPPORT
APPNAME ="Peercoin"

else ifeq ($(COIN),pivx)
# PivX
# 77 was used in the Chrome apps
BIP44_COIN_TYPE=119 
BIP44_COIN_TYPE_2=77 
COIN_P2PKH_VERSION=30 
COIN_P2SH_VERSION=13 
COIN_FAMILY=1 
COIN_COINID=\"DarkNet\" 
COIN_COINID_NAME="PivX"
COIN_COINID_SHORT=\"PIVX\" 
COIN_KIND=COIN_KIND_PIVX
APPNAME ="PivX"

else ifeq ($(COIN),viacoin)
# Viacoin
BIP44_COIN_TYPE=14 
BIP44_COIN_TYPE_2=14 
COIN_P2PKH_VERSION=71 
COIN_P2SH_VERSION=33 
COIN_FAMILY=1 
COIN_COINID=\"Viacoin\" 
COIN_COINID_NAME="Viacoin"
COIN_COINID_SHORT=\"VIA\" 
COIN_KIND=COIN_KIND_VIACOIN 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Viacoin"

else ifeq ($(COIN),vertcoin)
# Vertcoin
# 128 was used in the Chrome apps
BIP44_COIN_TYPE=28 
BIP44_COIN_TYPE_2=128 
COIN_P2PKH_VERSION=71 
COIN_P2SH_VERSION=5 
COIN_FAMILY=1 
COIN_COINID=\"Vertcoin\" 
COIN_COINID_NAME="Vertcoin"
COIN_COINID_SHORT=\"VTC\" 
COIN_NATIVE_SEGWIT_PREFIX=\"vtc\" 
COIN_KIND=COIN_KIND_VERTCOIN 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Vertcoin"

else ifeq ($(COIN),digibyte)
BIP44_COIN_TYPE=20 
BIP44_COIN_TYPE_2=20 
COIN_P2PKH_VERSION=30 
COIN_P2SH_VERSION=63 
COIN_FAMILY=1 
COIN_COINID=\"DigiByte\" 
COIN_COINID_NAME="Digibyte"
COIN_COINID_SHORT=\"DGB\" 
COIN_NATIVE_SEGWIT_PREFIX=\"dgb\" 
COIN_KIND=COIN_KIND_DIGIBYTE 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Digibyte"

else ifeq ($(COIN),qtum)
$(error the qtum variant is deprecated and has been moved to its dedicated repo)
else ifeq ($(COIN),firo)
BIP44_COIN_TYPE=136 
BIP44_COIN_TYPE_2=136 
COIN_P2PKH_VERSION=82 
COIN_P2SH_VERSION=7 
COIN_FAMILY=1 
COIN_COINID=\"Zcoin\" 
COIN_COINID_NAME="Firo"
COIN_COINID_SHORT=\"FIRO\" 
COIN_KIND=COIN_KIND_FIRO
APPNAME ="Firo"

else ifeq ($(COIN),bitcoin_private)
# Bitcoin Private
# Initial fork from Bitcoin, public key access is authorized. Signature is different thanks to the forkId
# Note : might need a third lock on ZClassic
BIP44_COIN_TYPE=183 
BIP44_COIN_TYPE_2=0 
COIN_P2PKH_VERSION=4901 
COIN_P2SH_VERSION=5039 
COIN_FAMILY=1 
COIN_COINID=\"BPrivate\" 
COIN_COINID_NAME="Bitcoin Private"
COIN_COINID_SHORT=\"BTCP\" 
COIN_KIND=COIN_KIND_BITCOIN_PRIVATE 
COIN_FORKID=42
APPNAME ="Bitcoin Private"

else ifeq ($(COIN),gamecredits)
# GameCredits
BIP44_COIN_TYPE=101  
BIP44_COIN_TYPE_2=101 
COIN_P2PKH_VERSION=38 
COIN_P2SH_VERSION=62 
COIN_FAMILY=1 
COIN_COINID=\"GameCredits\" 
COIN_COINID_NAME="GameCredits"
COIN_COINID_SHORT=\"GAME\" 
COIN_KIND=COIN_KIND_GAMECREDITS 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="GameCredits"

else ifeq ($(COIN),zclassic)
# ZClassic
BIP44_COIN_TYPE=147  
BIP44_COIN_TYPE_2=147 
COIN_P2PKH_VERSION=7352 
COIN_P2SH_VERSION=7357 
COIN_FAMILY=1 
COIN_COINID=\"ZClassic\" 
COIN_COINID_NAME="ZClassic"
COIN_COINID_SHORT=\"ZCL\" 
COIN_KIND=COIN_KIND_ZCLASSIC
APPNAME ="ZClassic"

else ifeq ($(COIN),nix)
# NIX
BIP44_COIN_TYPE=400  
BIP44_COIN_TYPE_2=400 
COIN_P2PKH_VERSION=38 
COIN_P2SH_VERSION=53 
COIN_FAMILY=1 
COIN_COINID=\"NIX\" 
COIN_COINID_NAME="NIX"
COIN_COINID_SHORT=\"NIX\" 
COIN_NATIVE_SEGWIT_PREFIX=\"nix\" 
COIN_KIND=COIN_KIND_NIX 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="NIX"

else ifeq ($(COIN),lbry)
# LBRY
BIP44_COIN_TYPE=140  
BIP44_COIN_TYPE_2=140 
COIN_P2PKH_VERSION=85 
COIN_P2SH_VERSION=122 
COIN_FAMILY=1 
COIN_COINID=\"LBRY\" 
COIN_COINID_NAME="LBRY"
COIN_COINID_SHORT=\"LBC\" 
COIN_KIND=COIN_KIND_LBRY
APPNAME ="LBRY"

else ifeq ($(COIN),resistance)
# Resistance
BIP44_COIN_TYPE=356  
BIP44_COIN_TYPE_2=356 
COIN_P2PKH_VERSION=7063 
COIN_P2SH_VERSION=7068 
COIN_FAMILY=1 
COIN_COINID=\"Res\" 
COIN_COINID_NAME="Resistance"
COIN_COINID_SHORT=\"RES\" 
COIN_KIND=COIN_KIND_RESISTANCE
APPNAME ="Resistance"

else ifeq ($(COIN),ravencoin)
# Ravencoin
BIP44_COIN_TYPE=175  
BIP44_COIN_TYPE_2=175 
COIN_P2PKH_VERSION=60 
COIN_P2SH_VERSION=122 
COIN_FAMILY=1 
COIN_COINID=\"Ravencoin\" 
COIN_COINID_NAME="Ravencoin"
COIN_COINID_SHORT=\"RVN\" 
COIN_KIND=COIN_KIND_RAVENCOIN
APPNAME ="Ravencoin"

else ifeq ($(COIN),hydra_testnet)
# Hydra testnet
BIP44_COIN_TYPE=0 
BIP44_COIN_TYPE_2=0 
COIN_P2PKH_VERSION=66 
COIN_P2SH_VERSION=128 
COIN_FAMILY=3 
COIN_COINID=\"Hydra\" 
COIN_COINID_NAME="Hydra Test"
COIN_COINID_SHORT=\"HYDRA\" 
COIN_NATIVE_SEGWIT_PREFIX=\"hc\" 
COIN_KIND=COIN_KIND_HYDRA 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Hydra Test"
APP_LOAD_PARAMS += --path "44'/609'"

else ifeq ($(COIN),hydra)
# Hydra mainnet
BIP44_COIN_TYPE=0 
BIP44_COIN_TYPE_2=0 
COIN_P2PKH_VERSION=40 
COIN_P2SH_VERSION=63 
COIN_FAMILY=3 
COIN_COINID=\"Hydra\" 
COIN_COINID_NAME="Hydra"
COIN_COINID_SHORT=\"HYDRA\" 
COIN_NATIVE_SEGWIT_PREFIX=\"hc\" 
COIN_KIND=COIN_KIND_HYDRA 
COIN_FLAGS=FLAG_SEGWIT_CHANGE_SUPPORT
APPNAME ="Hydra"
APP_LOAD_PARAMS += --path "44'/609'"

else ifeq ($(COIN),pepecoin)
# Pepe
BIP44_COIN_TYPE=3434 
BIP44_COIN_TYPE_2=3434 
COIN_P2PKH_VERSION=56 
COIN_P2SH_VERSION=22 
COIN_FAMILY=1 
COIN_COINID=\"Pepecoin\" 
COIN_COINID_NAME="Pepecoin"
COIN_COINID_SHORT=\"PEPE\" 
COIN_KIND=COIN_KIND_DOGE
APPNAME ="Pepecoin"

else ifeq ($(filter clean,$(MAKECMDGOALS)),)
$(error Unsupported COIN - use $(VARIANT_VALUES))
endif

include lib-app-bitcoin/Makefile
