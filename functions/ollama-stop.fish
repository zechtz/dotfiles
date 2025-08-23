function ollama-stop
    if pgrep -x ollama >/dev/null
        echo "🛑 Stopping Ollama..."
        kill (pgrep -x ollama)
        echo "✅ Ollama stopped"
    else
        echo "ℹ️  Ollama is not running"
    end
end
