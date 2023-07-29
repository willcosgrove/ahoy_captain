module AhoyCaptain
  module ApplicationHelper
    def ahoy_captain_importmap_tags(entry_point = "application", shim: true)
      safe_join [
        javascript_inline_importmap_tag(AhoyCaptain.importmap.to_json(resolver: self)),
        javascript_importmap_module_preload_tags(AhoyCaptain.importmap),
        javascript_import_module_tag(entry_point),
        (javascript_importmap_shim_nonce_configuration_tag if shim),
        (javascript_importmap_shim_tag if shim),
      ].compact, "\n"
    end

    def search_params
      request.query_parameters
    end
  end
end
