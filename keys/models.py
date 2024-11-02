"""Models for the keys."""
from pydantic import BaseModel


class ProviderNameModel(BaseModel):
    """
    Model for MongoDB credentials.
    """
    api_key: str


class Keys(BaseModel):
    """
    Model for all keys.
    """
    Provider: ProviderNameModel
