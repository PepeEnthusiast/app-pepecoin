from pathlib import Path

from ledger_bitcoin import WalletPolicy, PartialSignature

from ledger_bitcoin.psbt import PSBT

from ragger_bitcoin import RaggerClient
from ragger_bitcoin.ragger_instructions import Instructions
from ragger.navigator import Navigator
from ragger.firmware import Firmware
tests_root: Path = Path(__file__).parent


CURRENCY_TICKER = "PEP"


def sign_psbt_instruction_approve(model: Firmware) -> Instructions:
    instructions = Instructions(model)

    if model.name.startswith("nano"):
        instructions.new_request("Accept")
        instructions.same_request("Accept")
    else:
        instructions.review_start()
        instructions.review_fees()
        instructions.confirm_transaction()
    return instructions


def sign_psbt_instruction_approve_2(model: Firmware) -> Instructions:
    instructions = Instructions(model)

    if model.name.startswith("nano"):
        instructions.new_request("Accept")
        instructions.new_request("Accept")
    else:
        instructions.review_start()
        instructions.review_fees(fees_on_same_request=False)
        instructions.confirm_transaction()
    return instructions


def open_psbt_from_file(filename: str) -> PSBT:
    raw_psbt_base64 = open(filename, "r").read()

    psbt = PSBT()
    psbt.deserialize(raw_psbt_base64)
    return psbt


def test_sign_psbt_singlesig_pkh_1to1(
        navigator: Navigator, firmware: Firmware, client: RaggerClient, test_name: str):

    # PSBT for a legacy 1-input 1-output spend (no change address)
    psbt = open_psbt_from_file(f"{tests_root}/psbt/singlesig/pkh-1to1.psbt")

    wallet = WalletPolicy(
        "",
        "pkh(@0/**)",
        ["[f5acc2fd/44'/1'/0']xpub6CZvDaQ1mMRp7HfabkhHU5iQ8jm5CWm4wWuXA3vgYcLZg6vfjLeSjMpeCi7xEuBVX55qHdoK43pYCPxNNfjWa27yf5D7RE7GHhfEwJu1Dzb"],
    )

    # expected sigs:
    # #0:
    #  "pubkey" : "02ee8608207e21028426f69e76447d7e3d5e077049f5e683c3136c2314762a4718",
    #  "signature" : "3045022100e55b3ca788721aae8def2eadff710e524ffe8c9dec1764fdaa89584f9726e196022012a30fbcf9e1a24df31a1010356b794ab8de438b4250684757ed5772402540f401"
    result = client.sign_psbt(psbt, wallet, None, navigator=navigator,
                              instructions=sign_psbt_instruction_approve(firmware),
                              testname=test_name)

    assert result == [(0, PartialSignature(pubkey=bytes.fromhex("02ee8608207e21028426f69e76447d7e3d5e077049f5e683c3136c2314762a4718"), signature=bytes.fromhex(
        "3045022100e55b3ca788721aae8def2eadff710e524ffe8c9dec1764fdaa89584f9726e196022012a30fbcf9e1a24df31a1010356b794ab8de438b4250684757ed5772402540f401")))]