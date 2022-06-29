import re
import logging 
import json

from django.contrib.contenttypes.models import ContentType
from nautobot.extras.models import Relationship
from nautobot.extras.models import RelationshipAssociation
from nautobot.tenancy.models import Tenant

from netutils.config.compliance import feature_compliance

logger = logging.getLogger("nautobot")


PFX_ENTRY_PATT = re.compile("seq\s\d+\s(permit|deny)\s(?P<prefix>\d+\.\d+\.\d+\.\d+/\d{1,2})")

def _null_to_empty(val):
    """Convert to empty string if the value is currently null."""
    if not val:
        return ""
    return val

def custom_compliance_func(obj):
    # logger.info(f"Loading Rule: {obj.rule} Platform: {obj.device.platform.slug}")
    compliance_int = 1
    compliance = True
    ordered = True
    missing = ""
    extra = ""
    # actual = obj.actual
    if obj.rule.feature.slug == 'prefix-list' and obj.device.platform.slug == 'arista_eos':
        logger.info(f"Custom compliance: Running for {obj.rule.feature.slug} {obj.device.platform.slug} on {obj.device}")
        rel = Relationship.objects.get(slug="compliance_rule_exclusion")
        if RelationshipAssociation.objects.filter(
                relationship=rel,
                source_type=ContentType.objects.get_for_model(obj.rule),
                source_id=obj.rule.pk,
                destination_type=ContentType.objects.get_for_model(Tenant),
                destination_id=obj.device.tenant.pk,
        ):
            logger.debug(f"Custom compliance: Found feature {obj.rule.feature.slug} with rel {rel.slug} for tenant {obj.device.tenant} on {obj.device}")
            actual_config = obj.actual
            intended_config = obj.intended
            actual_prefixes = []
            intended_prefixes = []

            for line in actual_config.splitlines():
                match = PFX_ENTRY_PATT.search(line)
                if match:
                    actual_prefixes.append(match.group("prefix"))

            for line in intended_config.splitlines():
                match = PFX_ENTRY_PATT.search(line)
                if match:
                    intended_prefixes.append(match.group("prefix"))

            intended_diff = set(intended_prefixes) - set(actual_prefixes)
            actual_diff = set(actual_prefixes) - set(intended_prefixes)
            if intended_diff:
                compliance_int = 0
                compliance = False
                ordered = False
                missing = ""
                extra = ""
                missing = f"Missing prefix(es): {', '.join(intended_diff)}"
            
            # # NOTE: THIS IS NOT SUPPORTED in nautobot-plugin-golden-config
            # # add comments to the ignored config
            # actual_updated = ""
            # for line in actual_config.splitlines():
            #     match = PFX_ENTRY_PATT.search(line)
            #     actual_line = line
            #     if match and match.group("prefix") in actual_diff:
            #         actual_line += " ## IGNORED"
            #     actual_updated += actual_line
            # actual = json.dumps(actual_updated)
            # logger.debug(f"Custom compliance: Setting actual {actual} with updated {actual_updated} for config {actual_config} on {obj.device}")
        else:
            # should account for platform_map here with platform
            cli_feature = {
                "ordered": obj.rule.config_ordered,
                "name": obj.rule,
            }
            cli_feature.update({"section": obj.rule.match_config.splitlines()})
            value = feature_compliance(cli_feature, obj.actual, obj.intended, obj.device.platform.slug)
            logger.debug(f"Custom compliance: No tenant exclusion {value} on {obj.device}")
            compliance = value["compliant"]
            if compliance:
                compliance_int = 1
                ordered = value["ordered_compliant"]
            else:
                compliance_int = 0
                ordered = value["ordered_compliant"]
            missing = _null_to_empty(value["missing"])
            extra = _null_to_empty(value["extra"])
    return {
        "compliance": compliance,
        "compliance_int": compliance_int,
        "ordered": ordered,
        "missing": missing,
        "extra": extra,
    }