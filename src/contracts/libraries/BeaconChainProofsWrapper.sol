// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import "./BeaconChainProofs.sol";
import "./Merkle.sol";
import "./Endian.sol";

/**
 * @title BeaconChainProofsWrapper
 * @notice A wrapper contract that exposes BeaconChainProofs library functions as external calls
 * @dev This contract allows any external caller to use BeaconChainProofs functionality
 */
contract BeaconChainProofsWrapper {
    using BeaconChainProofs for *;

    /// @notice Returns the beacon state tree height based on the proof timestamp
    function getBeaconStateTreeHeight(uint64 proofTimestamp) external pure returns (uint256) {
        return BeaconChainProofs.getBeaconStateTreeHeight(proofTimestamp);
    }

    /// @notice Verify a merkle proof of the beacon state root against a beacon block root
    function verifyStateRoot(bytes32 beaconBlockRoot, BeaconChainProofs.StateRootProof calldata proof) external view {
        BeaconChainProofs.verifyStateRoot(beaconBlockRoot, proof);
    }

    /// @notice Verify a merkle proof of a validator container against a beaconStateRoot
    function verifyValidatorFields(
        uint64 proofTimestamp,
        bytes32 beaconStateRoot,
        bytes32[] calldata validatorFields,
        bytes calldata validatorFieldsProof,
        uint40 validatorIndex
    ) external view {
        BeaconChainProofs.verifyValidatorFields(
            proofTimestamp,
            beaconStateRoot,
            validatorFields,
            validatorFieldsProof,
            validatorIndex
        );
    }

    /// @notice Verify a merkle proof of the beacon state's balances container against the beacon block root
    function verifyBalanceContainer(
        uint64 proofTimestamp,
        bytes32 beaconBlockRoot,
        BeaconChainProofs.BalanceContainerProof calldata proof
    ) external view {
        BeaconChainProofs.verifyBalanceContainer(proofTimestamp, beaconBlockRoot, proof);
    }

    /// @notice Verify a merkle proof of a validator's balance against the beacon state's balanceContainerRoot
    function verifyValidatorBalance(
        bytes32 balanceContainerRoot,
        uint40 validatorIndex,
        BeaconChainProofs.BalanceProof calldata proof
    ) external view returns (uint64) {
        return BeaconChainProofs.verifyValidatorBalance(balanceContainerRoot, validatorIndex, proof);
    }

    /// @notice Get balance at index from a balance root
    function getBalanceAtIndex(bytes32 balanceRoot, uint40 validatorIndex) external pure returns (uint64) {
        return BeaconChainProofs.getBalanceAtIndex(balanceRoot, validatorIndex);
    }

    /// @notice Get validator's pubkey hash from validator fields
    function getPubkeyHash(bytes32[] memory validatorFields) external pure returns (bytes32) {
        return BeaconChainProofs.getPubkeyHash(validatorFields);
    }

    /// @notice Get validator's withdrawal credentials from validator fields
    function getWithdrawalCredentials(bytes32[] memory validatorFields) external pure returns (bytes32) {
        return BeaconChainProofs.getWithdrawalCredentials(validatorFields);
    }

    /// @notice Get validator's effective balance in gwei from validator fields
    function getEffectiveBalanceGwei(bytes32[] memory validatorFields) external pure returns (uint64) {
        return BeaconChainProofs.getEffectiveBalanceGwei(validatorFields);
    }

    /// @notice Get validator's activation epoch from validator fields
    function getActivationEpoch(bytes32[] memory validatorFields) external pure returns (uint64) {
        return BeaconChainProofs.getActivationEpoch(validatorFields);
    }

    /// @notice Check if validator is slashed from validator fields
    function isValidatorSlashed(bytes32[] memory validatorFields) external pure returns (bool) {
        return BeaconChainProofs.isValidatorSlashed(validatorFields);
    }

    /// @notice Get validator's exit epoch from validator fields
    function getExitEpoch(bytes32[] memory validatorFields) external pure returns (uint64) {
        return BeaconChainProofs.getExitEpoch(validatorFields);
    }

    /// @notice Constants exposed from BeaconChainProofs
    function BEACON_BLOCK_HEADER_TREE_HEIGHT() external pure returns (uint256) {
        return BeaconChainProofs.BEACON_BLOCK_HEADER_TREE_HEIGHT;
    }

    function DENEB_BEACON_STATE_TREE_HEIGHT() external pure returns (uint256) {
        return BeaconChainProofs.DENEB_BEACON_STATE_TREE_HEIGHT;
    }

    function PECTRA_BEACON_STATE_TREE_HEIGHT() external pure returns (uint256) {
        return BeaconChainProofs.PECTRA_BEACON_STATE_TREE_HEIGHT;
    }

    function BALANCE_TREE_HEIGHT() external pure returns (uint256) {
        return BeaconChainProofs.BALANCE_TREE_HEIGHT;
    }

    function VALIDATOR_TREE_HEIGHT() external pure returns (uint256) {
        return BeaconChainProofs.VALIDATOR_TREE_HEIGHT;
    }

    function STATE_ROOT_INDEX() external pure returns (uint256) {
        return BeaconChainProofs.STATE_ROOT_INDEX;
    }

    function VALIDATOR_CONTAINER_INDEX() external pure returns (uint256) {
        return BeaconChainProofs.VALIDATOR_CONTAINER_INDEX;
    }

    function BALANCE_CONTAINER_INDEX() external pure returns (uint256) {
        return BeaconChainProofs.BALANCE_CONTAINER_INDEX;
    }

    function VALIDATOR_FIELDS_LENGTH() external pure returns (uint256) {
        return BeaconChainProofs.VALIDATOR_FIELDS_LENGTH;
    }

    function SECONDS_PER_SLOT() external pure returns (uint64) {
        return BeaconChainProofs.SECONDS_PER_SLOT;
    }

    function SLOTS_PER_EPOCH() external pure returns (uint64) {
        return BeaconChainProofs.SLOTS_PER_EPOCH;
    }

    function SECONDS_PER_EPOCH() external pure returns (uint64) {
        return BeaconChainProofs.SECONDS_PER_EPOCH;
    }

    function FAR_FUTURE_EPOCH() external pure returns (uint64) {
        return BeaconChainProofs.FAR_FUTURE_EPOCH;
    }

    function PECTRA_FORK_TIMESTAMP() external pure returns (uint64) {
        return BeaconChainProofs.PECTRA_FORK_TIMESTAMP;
    }
} 