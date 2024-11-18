```md
[![tests](https://github.com/ORGANIZATION/REPO/actions/workflows/tests.yaml/badge.svg)](https://github.com/ORGANIZATION/REPO/actions/workflows/tests.yaml)
```

# FastAPI Factory

A factory for a FastAPI application.

## Setup

1. Set API titles, descriptions, etc. in `api/__init__.py`. `module` is the main application package––change the name, and update `tests/test_modules.py` to reflect the new name.
2. Set the name of the GCP project and container in `.github/workflows/google-cloud.yaml` and `.github/workflows/deploy-preview.yaml`.
   - `:%s/CONTAINER_NAME/NEW_NAME/g` and `:%s/GCP_PROJECT/NEW_NAME/g`
   - Google Cloud setup: Create a service account with permissions Service Account User, Cloud Run Admin, Storage Admin, Artifact Registry Admin, and Artifact Registry Create-on-Push Admin.
3. Add secrets to GitHub Actions: `KEYS_YAML` and `KEYS_YAML_TESTS`. The first is for the main branch, the second is for pull requests. These follow the same format. Also add `GCP_SA_KEY` to the secrets.

## Keys Structure

The keys structure in this project is defined using Pydantic BaseModels. This approach provides type checking and validation for your configuration.

### BaseModel Structure

The structure of the keys is defined in `keys/models.py`. Here's how it works:

1. Individual provider models:
   ```python
   class ProviderNameModel(BaseModel):
       api_key: str
   ```

2. Main Keys model:
   ```python
   class Keys(BaseModel):
       Provider: ProviderNameModel
   ```
   This model combines all provider models into a single structure.

To access keys throughout your API:

1. Import the `KEYS` object at the top of your file:
   ```python
   from keys import KEYS
   ```

2. Access the keys using dot notation:
   ```python
   api_key = KEYS.Provider.api_key
   ```
