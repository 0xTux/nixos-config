local opts = {
  provider = "ollama",
  vendors = {
    ollama = {
      ["local"] = true,
      endpoint = "100.64.0.1:11434/v1",
      model = "deepseek-coder-v2",
      parse_curl_args = function(opts, code_opts)
        return {
          url = opts.endpoint .. "/chat/completions",
          headers = {
            ["Accept"] = "application/json",
            ["Content-Type"] = "application/json",
          },
          body = {
            model = opts.model,
            messages = require("avante.providers").copilot.parse_message(code_opts),
            max_tokens = 2048,
            stream = true,
          },
        }
      end,
      parse_response_data = function(data_stream, event_state, opts)
        require("avante.providers").openai.parse_response(data_stream, event_state, opts)
      end,
    },
  },
}

return opts
