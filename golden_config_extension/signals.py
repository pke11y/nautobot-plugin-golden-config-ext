"""Nautobot signal handler functions for nautobot_golden_config."""
import logging
from django.contrib.contenttypes.models import ContentType
from django.db.models.signals import pre_save, post_save
from django.dispatch import receiver
from nautobot.extras.models import Relationship
from nautobot.extras.models import RelationshipAssociation
from nautobot.tenancy.models import Tenant

from nautobot_golden_config.models import ConfigCompliance
from nautobot_golden_config.models import ComplianceRule

logger = logging.getLogger("nautobot")
logger.info("Loading signal")

# @receiver(pre_save, sender="nautobot_golden_config.ConfigCompliance")
@receiver(post_save, sender="nautobot_golden_config.ConfigCompliance")
def clean_result(sender, instance, **kwargs):  # pylint: disable=unused-argument
    """Clean Existing results of Config Compliance object before saving it."""
    rel = Relationship.objects.get(slug="compliance_rule_exclusion")
    logger.info("Signal running..")
    if instance.device and instance.device.tenant:
        logger.info(f"Signal: Found {instance.device} {instance.device.tenant}")
        if RelationshipAssociation.objects.filter(
                relationship=rel,
                source_type=ContentType.objects.get_for_model(ComplianceRule),
                source_id=instance.rule.pk,
                destination_type=ContentType.objects.get_for_model(Tenant),
                destination_id=instance.device.tenant.pk,
        ):
            logger.debug(f"Signal: Setting compliance from {instance}")
            # NOTE: instance.save() causes a recursive save, update doesn't emit signal
            # ConfigCompliance.objects.filter(id=instance.pk).update(compliance=True, actual="", intended="", missing="", ordered=False, compliance_int=1)
            ConfigCompliance.objects.filter(id=instance.pk).update(compliance=True, compliance_int=1)
