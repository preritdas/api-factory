```md
[![tests](https://github.com/ORGANIZATION/REPO/actions/workflows/tests.yaml/badge.svg)](https://github.com/ORGANIZATION/REPO/actions/workflows/tests.yaml)
```

# FastAPI Factory

Description.

## Setup

1. Set API titles, descriptions, etc. in `api/__init__.py`. `module` is the main application package––change the name, and update `tests/test_modules.py` to reflect the new name.
2. Set the name of the GCP project and container in `.github/workflows/google-cloud.yaml` and `.github/workflows/deploy-preview.yaml`.
3. Add secrets to GitHub Actions: `KEYS_YAML` and `KEYS_YAML_TESTS`. The first is for the main branch, the second is for pull requests. These follow the same format. Also add `GCP_SA_KEY` to the secrets.
