from ragger.navigator import Navigator
from ragger.firmware import Firmware
from ragger_bitcoin import RaggerClient
from ragger_bitcoin.ragger_instructions import Instructions
from ragger.navigator import NavInsID


def pubkey_instruction_approve(model: Firmware) -> Instructions:
    instructions = Instructions(model)

    if model.name.startswith("nano"):
        instructions.new_request("Approve")
    else:
        instructions.address_confirm()
        instructions.same_request("Address", NavInsID.USE_CASE_REVIEW_TAP,
                                  NavInsID.USE_CASE_STATUS_DISMISS)
    return instructions


def pubkey_instruction_warning_approve(model: Firmware) -> Instructions:
    instructions = Instructions(model)

    if model.name.startswith("nano"):
        instructions.new_request("Approve")
        instructions.same_request("Approve")
    else:
        instructions.new_request("Unusual", NavInsID.USE_CASE_CHOICE_CONFIRM,
                                 NavInsID.USE_CASE_CHOICE_CONFIRM)
        instructions.same_request("Confirm",
                                  NavInsID.SWIPE_CENTER_TO_LEFT,
                                  NavInsID.USE_CASE_ADDRESS_CONFIRMATION_CONFIRM)
        instructions.same_request("Address", NavInsID.USE_CASE_REVIEW_TAP,
                                  NavInsID.USE_CASE_STATUS_DISMISS)
    return instructions


def test_get_public_key(navigator: Navigator, firmware: Firmware,
                        client: RaggerClient, test_name: str):
    testcases = {
        "m/44'/3434'/1'/0/10":
        "xpub6HGrHERVNseCdXM8e8DsPVzkvewtRCFxMbKgzDpvkjFBLN2KKBY2z7sciBQguwSuwnwxrVXpxMwth1W7sFwrjF9T6PBQEZzbhAtwQFzhBdG"}
    for path, pubkey in testcases.items():
        assert pubkey == client.get_extended_pubkey(
            path=path,
            display=True,
            navigator=navigator,
            instructions=pubkey_instruction_approve(firmware),
            testname=f"{test_name}_{path}"
        )
    testcases = {
        "m/44'/3434'/0'": "xpub6CSbihR8Ms5HAfpTRChCJT7SGYwveG8Cw6qzmHsbMwqG9DtGXgEbrFmVSH5JTvEYZxNZmapzJcyeKzZ7f8YhnmUcE1hpMDjDFjSEPxtYiTZ",
        "m/44'/3434'/10'": "xpub6CSbihR8Ms5HaU5BX8yR3oTRHxAoHpE4D1LvMazszVrPUzJdTf1gsxwh39jfFyfn8FcHi72kd6NBsSCbtiPtn7y5qBRBe1yYbr62ZR2oDSF",
        "m/44'/3434'/2'/1/42": "xpub6H2vdf5L1aVC14Dt8gSxJfgUnrEXhUsfyFX1pkJ5vczchqTjG8Lm6PXqeg3jFvW4dk2CWGwCBjyrJ96nbcWbkuzeCyNtAcP8zur8Ga6URwe",
        "m/48'/3434'/4'/1'/0/7": "xpub6HgYBttK7fPbQNPLYXrYoFGx8Ykkuyc99n7oDR7ZnrozbFc4b7ti4kDvMRke7vRx77L1SRqnmmYBp9uJoyzujutGXcEh3ibViG9sfY7qLfU",
        "m/49'/3434'/1'/1/3": "xpub6FkXDHNruwko45LvVGYYuD26pyYzS7imw96JoZoWMrBUPxx5eEzFXD69UPeUtSWe6mkj8SWRJrw5ZU45uyua8pWifkRghiLNbu5LBnAMb7a",
        "m/86'/3434'/4'/1/12": "xpub6GFmd5JwGzRjQEAUVBMBjcf4kGR1sPyDqYZKzmokNVBgZKz51CcyqTdHwv4BTcYae1ZF2GSZahvxWViVfTvW8DbRE5gXwcnr4h1CSnpo6sz",
    }

    for path, pubkey in testcases.items():
        assert pubkey == client.get_extended_pubkey(
            path=path,
            display=True,
            navigator=navigator,
            instructions=pubkey_instruction_warning_approve(firmware),
            testname=f"{test_name}_{path}"
        )
