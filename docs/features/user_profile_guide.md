# UserProfile Feature Guide

This document provides an overview of the `user_profile` feature.

## Overview

The UserProfile feature provides functionality to manage and display userProfile data.

## Architecture

The feature follows Clean Architecture principles with the following layers:

- **Data Layer**: Handles data sources, models, and repository implementations
- **Domain Layer**: Contains business entities, repository interfaces, and use cases
- **Presentation Layer**: User interface components and state management

## Components

### Data Layer

- `user_profile_model.dart`: Data model representing a userProfile
- `user_profile_remote_datasource.dart`: Handles API calls for userProfile data
- `user_profile_local_datasource.dart`: Handles local storage for userProfile data
- `user_profile_repository_impl.dart`: Implements the repository interface

### Domain Layer

- `user_profile_entity.dart`: Core business entity
- `user_profile_repository.dart`: Repository interface defining data operations
- `get_all_user_profiles.dart`: Use case to retrieve all userProfiles
- `get_user_profile_by_id.dart`: Use case to retrieve a specific userProfile

### Presentation Layer

- `user_profile_list_screen.dart`: Screen to display a list of userProfiles
- `user_profile_detail_screen.dart`: Screen to display details of a specific userProfile
- `user_profile_list_item.dart`: Widget to display a single userProfile in a list

### Providers

- `user_profile_providers.dart`: Riverpod providers for the feature
- `user_profile_ui_providers.dart`: UI-specific state providers

## Usage

### Adding a UserProfile

1. Navigate to the UserProfile List Screen
2. Tap the + button
3. Fill in the required fields
4. Submit the form

### Viewing UserProfile Details

1. Navigate to the UserProfile List Screen
2. Tap on a UserProfile item to view its details

## Implementation Notes

- The feature uses Riverpod for state management
- Error handling follows the Either pattern from dartz
- Repository pattern is used to abstract data sources
