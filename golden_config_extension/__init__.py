"""Plugin declaration for golden_config_extension."""
# Metadata is inherited from Nautobot. If not including Nautobot in the environment, this should be added
try:
    from importlib import metadata
except ImportError:
    # Python version < 3.8
    import importlib_metadata as metadata

__version__ = metadata.version(__name__)

from nautobot.extras.plugins import PluginConfig


class GoldenConfigExtensionConfig(PluginConfig):
    """Plugin configuration for the golden_config_extension plugin."""

    name = "golden_config_extension"
    verbose_name = "Golden Config Extension"
    version = __version__
    author = "Network to Code, LLC"
    description = "Golden Config Extension."
    base_url = "golden-config-extension"
    required_settings = []
    min_version = "1.3.5"
    max_version = "1.9999"
    default_settings = {}
    caching_config = {}

    def ready(self):
        """Callback invoked after the plugin is loaded."""
        super().ready()

        from .signals import clean_result  # pylint: disable=import-outside-toplevel
        from .utils import custom_compliance_func

config = GoldenConfigExtensionConfig  # pylint:disable=invalid-name
