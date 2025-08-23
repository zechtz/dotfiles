function ollama-start
    if pgrep -x ollama >/dev/null
        echo "⚠️  Ollama is already running (PID: (pgrep -x ollama))"
    else
        echo "🚀 Starting Ollama..."
        ollama serve &>/dev/null &
        echo "✅ Ollama started"
    end
end
