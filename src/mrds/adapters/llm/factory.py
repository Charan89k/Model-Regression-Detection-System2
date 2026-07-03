from mrds.adapters.llm.anthropic_runner import AnthropicRunner
from mrds.adapters.llm.base import BaseLLMRunner
from mrds.adapters.llm.gemini_runner import GeminiRunner
from mrds.adapters.llm.openai_runner import OpenAIRunner
from mrds.core.exceptions.base import MRDSError


class LLMProviderNotSupportedError(MRDSError):
    """Raised when an unknown LLM provider is requested."""
    pass


class LLMFactory:
    """Dependency injection factory for LLM runners."""

    @staticmethod
    def get_runner(provider_name: str) -> BaseLLMRunner:
        provider_name = provider_name.lower().strip()
        
        if provider_name == "openai":
            return OpenAIRunner()
        elif provider_name == "anthropic":
            return AnthropicRunner()
        elif provider_name == "gemini":
            return GeminiRunner()
        else:
            raise LLMProviderNotSupportedError(f"Unsupported LLM provider: {provider_name}")
