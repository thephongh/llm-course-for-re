import Image from "next/image";

export default function Home() {
  return (
    <div className="bg-gray-100 text-gray-800 font-sans p-8">
      <header className="bg-white shadow-md rounded-lg p-6 mb-8">
        <h1 className="text-4xl font-extrabold text-gray-900 mb-4">
          Introduction to LLM and Generative AI for RE Energy Professionals
        </h1>
        <p className="text-lg text-gray-600">
          <strong>Target Audience:</strong> Non-tech-savvy professionals in the energy sector (project development, asset management).
        </p>
        <p className="text-lg text-gray-600">
          <strong>Course Objective:</strong> To provide a basic understanding of LLM and Generative AI, how they work, and best practices for effective chatbot usage in daily work.
        </p>
      </header>

      <main>
        <div id="course-outline" className="mb-8">
          <h2 className="text-3xl font-extrabold text-gray-900 mb-6 border-b-2 border-gray-200 pb-2">Course Outline</h2>
          <ul className="space-y-4">
            <li><a href="#module1" className="text-blue-600 hover:text-blue-800 hover:underline text-xl font-medium">Module 1: What is AI, Machine Learning, and Generative AI? (The Big Picture)</a></li>
            <li><a href="#module2" className="text-blue-600 hover:text-blue-800 hover:underline text-xl font-medium">Module 2: Understanding Large Language Models (LLMs) - The Core Technology</a></li>
            <li><a href="#module3" className="text-blue-600 hover:text-blue-800 hover:underline text-xl font-medium">Module 3: Chatbots and Your Daily Work (Practical Applications)</a></li>
            <li><a href="#module4" className="text-blue-600 hover:text-blue-800 hover:underline text-xl font-medium">Module 4: Mastering Prompt Engineering - Getting the Best Out of Chatbots</a></li>
            <li><a href="#module5" className="text-blue-600 hover:text-blue-800 hover:underline text-xl font-medium">Module 5: Responsible AI Usage in the Energy Sector</a></li>
          </ul>
        </div>

        <div className="space-y-12">
          <Module1 />
          <Module2 />
          <Module3 />
          <Module4 />
          <Module5 />
        </div>
      </main>

      <footer className="text-center mt-12 pt-6 border-t border-gray-300">
        <p className="text-gray-600 mb-2">Thank you for participating in this course! We hope you feel more confident in understanding and utilizing LLM and Generative AI in your daily work.</p>
        <p className="text-gray-800 font-bold">Course Author: Phong Han</p>
      </footer>
    </div>
  );
}

const Module1 = () => (
  <section id="module1" className="p-6 bg-white rounded-lg shadow">
    <h2 className="text-3xl font-extrabold text-gray-900 mb-4">Module 1: What is AI, Machine Learning, and Generative AI? (The Big Picture)</h2>
    <div className="space-y-4 text-gray-700">
      <p>Welcome to this course! In the coming hours, we'll demystify some of the most talked-about technologies today: Artificial Intelligence, Machine Learning, and Generative AI. Don't worry about technical jargon; we'll focus on what you need to know to use these tools effectively in your daily work.</p>
      <h3 className="text-2xl font-bold text-gray-800">1.1 Artificial Intelligence (AI) - The broad concept</h3>
      <ul className="list-disc list-inside space-y-2">
        <li><strong>What is it?</strong> Think of AI as making computers smart, capable of performing tasks that typically require human intelligence. This includes things like understanding speech, recognizing images, making decisions, and solving problems.</li>
        <li><strong>Examples in your daily life:</strong> When your phone suggests the next word you might type, when maps give you the fastest route, or when streaming services recommend movies – that's AI at work.</li>
      </ul>
      <figure className="text-center">
        <Image src="/media/ai_ml_dl_venn_diagram.png" alt="Venn Diagram of AI, ML, and Deep Learning" width={600} height={400} className="mx-auto w-auto h-auto"/>
        <figcaption className="text-sm text-gray-500 mt-2">Figure 1.1: Relationship between AI, Machine Learning, and Deep Learning.</figcaption>
      </figure>
      <h3 className="text-2xl font-bold text-gray-800">1.2 Machine Learning (ML) - How computers learn</h3>
      <ul className="list-disc list-inside space-y-2">
        <li><strong>What is it?</strong> Machine Learning is a <em>subset</em> of AI. It's about teaching computers to learn from data without being explicitly programmed for every single task. Instead of giving a computer specific rules, you give it lots of examples, and it figures out the rules itself.</li>
        <li><strong>How does it work?</strong> Imagine showing a computer thousands of pictures of cats and dogs. After a while, it learns to tell the difference between them on its own. That's machine learning.</li>
        <li><strong>Relevance:</strong> Many of the smart features you see in software, from predicting equipment failures to optimizing energy grids, often rely on machine learning.</li>
      </ul>
      <h3 className="text-2xl font-bold text-gray-800">1.3 Generative AI - AI that creates</h3>
      <ul className="list-disc list-inside space-y-2">
        <li><strong>What is it?</strong> Generative AI is a special kind of AI that <em>creates</em> new content. Unlike traditional AI that might analyze existing data or make predictions, Generative AI can produce original text, images, audio, video, or even code.</li>
        <li><strong>Think of it like this:</strong>
            <ul className="list-disc list-inside ml-6 space-y-1">
                <li>A comedian who learns to imitate others by observing people's behaviors.</li>
                <li>An artist who learns to paint in a particular style by studying many paintings in that style.</li>
                <li>A cover band that learns to sound like a specific music group by listening to lots of their music.</li>
            </ul>
        </li>
        <li><strong>Examples:</strong>
            <ul className="list-disc list-inside ml-6 space-y-1">
                <li><strong>Text-to-text:</strong> You give it a few bullet points about a meeting, and it drafts a full meeting summary.</li>
                <li><strong>Text-to-image:</strong> You describe "a solar farm at sunset," and it generates a unique image.</li>
                <li><strong>Text-to-code:</strong> You describe a simple script you need, and it writes the code for you.</li>
            </ul>
        </li>
        <li><strong>Why is this important for you?</strong> Generative AI, especially in the form of Large Language Models (LLMs), is what powers the advanced chatbots like ChatGPT, Gemini, and Claude that we'll discuss. These tools can directly assist you in generating reports, summarizing documents, brainstorming ideas, and much more.</li>
      </ul>
    </div>
  </section>
);

const Module2 = () => (
    <section id="module2" className="p-6 bg-white rounded-lg shadow">
    <h2 className="text-3xl font-extrabold text-gray-900 mb-4">Module 2: Understanding Large Language Models (LLMs) - The Core Technology</h2>
    <div className="space-y-4 text-gray-700">
        <p>Now that we understand Generative AI, let's dive into Large Language Models (LLMs), which are the foundation of many powerful AI tools available today.</p>
        <h3 className="text-2xl font-bold text-gray-800">2.1 What is a Language Model? (Simple explanation)</h3>
        <ul className="list-disc list-inside space-y-2">
            <li>At its heart, a language model is like a very sophisticated prediction engine for words. Given a sequence of words, it tries to predict the next most likely word or sequence of words.</li>
            <li><strong>Example:</strong> If I start a sentence with "The sun rises in the...", a language model would predict "east" with high probability. It's constantly estimating the probability of words occurring together.</li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">2.2 What makes LLMs "Large"? (Data and Parameters)</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>"Large" refers to two main things:</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li><strong>Vast Amounts of Data:</strong> LLMs are trained on enormous datasets of text and code from the internet – billions and billions of words. This includes books, articles, websites, conversations, and more. This massive exposure to human language allows them to learn complex patterns, grammar, facts, and even different styles of writing.</li>
                    <li><strong>Billions of Parameters:</strong> Think of "parameters" as the internal knobs and dials within the model that it adjusts during its learning process. The more parameters, the more complex patterns the model can recognize and generate. Modern LLMs have billions, even trillions, of these parameters.</li>
                </ul>
            </li>
            <li><strong>The result:</strong> This "largeness" enables LLMs to process longer texts, understand nuances, and perform complex tasks like summarization, translation, and answering questions in a surprisingly human-like way.</li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">2.3 How LLMs "Understand" and "Generate" Text (Tokens and Transformers - simplified)</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Tokens:</strong> LLMs don't read words letter by letter. They break down text into "tokens," which can be whole words, parts of words, or even punctuation. For example, "unbelievable" might be broken into "un," "believe," and "able." This helps them handle a massive vocabulary efficiently.</li>
        </ul>
        <figure className="text-center">
            <Image src="/media/tokens_illustration.png" alt="Illustration of text tokenization" width={600} height={300} className="mx-auto w-auto h-auto"/>
            <figcaption className="text-sm text-gray-500 mt-2">Figure 2.1: How text is broken down into tokens.</figcaption>
        </figure>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Transformers (The "Brain"):</strong> This is the underlying architecture that makes LLMs so powerful. Without getting technical, imagine the Transformer as a clever system that allows the LLM to pay attention to different parts of the input text when generating an output.
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li><strong>Example:</strong> If you ask an LLM to summarize a long report, the Transformer helps it identify and focus on the most important sentences and ideas throughout the entire document, rather than just the last few words. This is a huge leap from older models that had trouble remembering context from earlier in a conversation or document.</li>
                </ul>
            </li>
        </ul>
        <figure className="text-center">
            <Image src="/media/transformer_simplified.png" alt="Simplified Transformer architecture diagram" width={600} height={400} className="mx-auto w-auto h-auto"/>
            <figcaption className="text-sm text-gray-500 mt-2">Figure 2.2: Simplified diagram of a Transformer's attention mechanism.</figcaption>
        </figure>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>The Process:</strong> When you give an LLM a prompt, it:
                <ol className="list-decimal list-inside ml-6 space-y-1">
                    <li>Turns your prompt into tokens.</li>
                    <li>Processes these tokens using its "Transformer brain" and its learned knowledge.</li>
                    <li>Predicts the most probable next token, then the next, and so on, until it forms a complete and coherent response.</li>
                </ol>
            </li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">2.4 Common Applications of LLMs (Beyond just chatbots)</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Text Generation:</strong> Drafting emails, reports, marketing content, creative writing.</li>
            <li><strong>Summarization:</strong> Condensing long documents, articles, or meeting transcripts.</li>
            <li><strong>Translation:</strong> Translating text between different languages.</li>
            <li><strong>Question Answering:</strong> Providing direct answers to complex questions based on vast amounts of information.</li>
            <li><strong>Sentiment Analysis:</strong> Determining the emotional tone (positive, negative, neutral) of a piece of text, useful for customer feedback.</li>
            <li><strong>Code Generation:</strong> Assisting developers by writing code snippets or explaining existing code.</li>
            <li><strong>Data Extraction:</strong> Pulling specific pieces of information from unstructured text (e.g., project names, dates, key figures from contracts).</li>
        </ul>
    </div>
  </section>
);

const Module3 = () => (
    <section id="module3" className="p-6 bg-white rounded-lg shadow">
    <h2 className="text-3xl font-extrabold text-gray-900 mb-4">Module 3: Chatbots and Your Daily Work (Practical Applications)</h2>
    <div className="space-y-4 text-gray-700">
        <p>This module focuses on the practical side: how you can leverage popular AI chatbots to enhance your daily tasks in the energy sector.</p>
        <h3 className="text-2xl font-bold text-gray-800">3.1 What are Chatbots (ChatGPT, Gemini, Claude, Perplexity)?</h3>
        <ul className="list-disc list-inside space-y-2">
            <li>These are user-friendly interfaces that allow you to interact directly with powerful Large Language Models. Think of them as your personal AI assistant.</li>
            <li><strong>Examples:</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li><strong>ChatGPT (OpenAI):</strong> One of the pioneers, known for its conversational abilities.</li>
                    <li><strong>Gemini (Google):</strong> Google's advanced LLM, integrated into various Google products.</li>
                    <li><strong>Claude (Anthropic):</strong> Developed with a focus on safety and helpfulness.</li>
                    <li><strong>Perplexity AI:</strong> Combines LLM capabilities with real-time web search, providing sources for its answers. (This is particularly useful for research-heavy roles).</li>
                </ul>
            </li>
            <li><strong>Key takeaway:</strong> While they have different underlying models and slight variations, they all aim to understand your questions and generate human-like text responses.</li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">3.2 How Chatbots Can Help You in Project Development, Asset Management, etc.</h3>
        <p>These tools aren't just for tech gurus; they can be invaluable for professionals in roles like project development, asset management, and other functions within the energy sector.</p>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Brainstorming and Idea Generation:</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li>"Give me 5 innovative ways to finance a new renewable energy project."</li>
                    <li>"What are the key risks associated with developing offshore wind farms in Southeast Asia?"</li>
                    <li>"Suggest creative solutions for managing community engagement during large-scale infrastructure projects."</li>
                </ul>
            </li>
            <li><strong>Summarization:</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li>"Summarize this 20-page regulatory document on carbon capture technologies, focusing on key policy changes."</li>
                    <li>"Extract the main conclusions from this technical report on battery storage efficiency."</li>
                    <li>"Condense this long email thread about the latest project update into three bullet points."</li>
                </ul>
            </li>
            <li><strong>Drafting Communications:</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li>"Draft a polite email to a vendor requesting an extension on a delivery deadline for critical equipment."</li>
                    <li>"Write a brief internal memo announcing a new safety protocol for substation maintenance."</li>
                    <li>"Generate a project update report for stakeholders, highlighting progress on the solar farm construction and addressing recent challenges."</li>
                </ul>
            </li>
            <li><strong>Research and Information Gathering (especially with tools like Perplexity AI):</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li>"What are the current global trends in hydrogen production for energy storage?"</li>
                    <li>"Explain the concept of 'energy transition' in simple terms for a non-technical audience."</li>
                    <li>"List major companies involved in grid modernization efforts in North America."</li>
                    <li>"Find recent news articles about government incentives for geothermal energy projects."</li>
                </ul>
            </li>
            <li><strong>Learning and Explaining Complex Concepts:</strong>
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li>"Explain 'power purchase agreements' (PPAs) as if I'm new to energy finance."</li>
                    <li>"What is the difference between CapEx and OpEx in the context of power plant operations?"</li>
                    <li>"Provide a simplified overview of smart grid technology."</li>
                </ul>
            </li>
        </ul>
        <figure className="text-center">
            <Image src="/media/chatbot_interface_example.png" alt="Example of a chatbot interface" width={600} height={400} className="mx-auto w-auto h-auto"/>
            <figcaption className="text-sm text-gray-500 mt-2">Figure 3.1: Example of a chatbot interface showing a typical interaction.</figcaption>
        </figure>
        <h3 className="text-2xl font-bold text-gray-800">3.3 Understanding Chatbot Limitations and Risks</h3>
        <p>While powerful, these tools are not infallible. It's crucial to understand their limitations:</p>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>"Hallucinations" / Inaccuracy:</strong> LLMs can sometimes generate information that sounds plausible but is completely false or made up. They don't "know" facts; they predict sequences of words based on patterns. <strong>Always verify critical information.</strong></li>
            <li><strong>Bias:</strong> Because LLMs are trained on vast amounts of internet data, they can inadvertently pick up and perpetuate biases present in that data. This means their responses might reflect societal biases, which is a significant concern, especially when dealing with sensitive topics.</li>
            <li><strong>Lack of Real-time Knowledge (for some):</strong> Many LLMs have a "knowledge cutoff" date (e.g., trained up to early 2023). They won't know about very recent events unless they are connected to real-time search (like Perplexity AI or some versions of Gemini/ChatGPT).</li>
            <li><strong>Privacy and Confidentiality:</strong> <strong>NEVER input sensitive, confidential, or proprietary company information into public chatbots.</strong> Assume anything you type into a public chatbot might be used to train the model or stored. If your company uses an enterprise version, check their specific data handling policies.</li>
            <li><strong>Lack of True Understanding:</strong> They don't "think" or "understand" in the human sense. They are complex pattern-matching machines.</li>
            <li><strong>Over-reliance:</strong> Don't let AI replace your critical thinking or professional judgment. It's a tool to augment your work, not replace it.</li>
        </ul>
    </div>
  </section>
);

const Module4 = () => (
    <section id="module4" className="p-6 bg-white rounded-lg shadow">
    <h2 className="text-3xl font-extrabold text-gray-900 mb-4">Module 4: Mastering Prompt Engineering - Getting the Best Out of Chatbots</h2>
    <div className="space-y-4 text-gray-700">
        <p>The quality of the output from an LLM largely depends on the quality of your input. This is where "Prompt Engineering" comes in. It's the art and science of crafting effective instructions (prompts) to get the best possible results.</p>
        <h3 className="text-2xl font-bold text-gray-800">4.1 The Art of Asking the Right Questions</h3>
        <ul className="list-disc list-inside space-y-2">
            <li>Think of the chatbot as an incredibly knowledgeable but somewhat literal intern. If you give vague instructions, you'll get vague results. If you're clear, specific, and provide context, it can be incredibly helpful.</li>
            <li><strong>Good news:</strong> You don't need to be a coder! Creativity and persistence are your best assets here.</li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">4.2 Key Principles for Effective Prompting</h3>
        <ol className="list-decimal list-inside space-y-4">
            <li><strong>Be Clear and Specific:</strong> Avoid ambiguity. Tell the model exactly what you want.
                <ul className="list-disc list-inside ml-6 space-y-1 italic">
                    <li><em>Bad:</em> "Write about energy."</li>
                    <li><em>Good:</em> "Write a 200-word introduction to the concept of grid modernization for a report aimed at non-technical executives."</li>
                </ul>
            </li>
            <li><strong>Provide Context:</strong> Give the LLM all the necessary background information.
                <ul className="list-disc list-inside ml-6 space-y-1 italic">
                    <li>"I'm working on a proposal for a new solar farm in a desert region. The client is a large utility company. Draft an executive summary that highlights the environmental benefits and long-term cost savings."</li>
                </ul>
            </li>
            <li><strong>Set Constraints:</strong> Tell the LLM what <em>not</em> to do, or what format to follow.
                <ul className="list-disc list-inside ml-6 space-y-1 italic">
                    <li>"Summarize this article in exactly three bullet points."</li>
                    <li>"List the pros and cons of nuclear power, but exclude any discussion of waste disposal."</li>
                    <li>"Respond in a formal, professional tone."</li>
                </ul>
            </li>
            <li><strong>Break Down Complex Tasks:</strong> For multi-step problems, guide the LLM through each step.
                <ul className="list-disc list-inside ml-6 space-y-1 italic">
                    <li>Instead of "Write a full business plan for a wind energy startup," try:
                        <ul className="list-disc list-inside ml-6 space-y-1">
                            <li>"First, outline the key sections of a business plan for a wind energy startup."</li>
                            <li>"Next, for the 'Market Analysis' section, identify the top 3 target markets."</li>
                            <li>"Then, draft the 'Executive Summary' based on the outline and market analysis."</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><strong>Ask for Self-Correction/Evaluation:</strong> Encourage the LLM to review its own work.
                <ul className="list-disc list-inside ml-6 space-y-1 italic">
                    <li>"Summarize this paragraph. Then, rate your summary on a scale of 1-10 for conciseness and clarity, and explain your rating."</li>
                    <li>"Draft a response to this customer complaint. Before providing the response, list three ways it could be misconstrued."</li>
                </ul>
            </li>
        </ol>
        <h3 className="text-2xl font-bold text-gray-800">4.3 Practical Prompting Techniques</h3>
        <p>Let's look at some common and powerful prompting methods:</p>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Direct Prompting (Zero-shot):</strong> The simplest approach. You just give the instruction and some context.
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li><strong>Example:</strong> "List 5 challenges in managing large-scale energy infrastructure projects."</li>
                    <li><strong>Role Prompting:</strong> You can assign a role to the AI to guide its tone and perspective.
                        <ul className="list-disc list-inside ml-6 space-y-1">
                            <li><strong>Example:</strong> "You are an experienced energy consultant. Explain the concept of 'energy storage arbitrage' to a group of investors."</li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><strong>Prompting with Examples (One-shot, Few-shot):</strong> Show the LLM what you want by providing examples. This is great for specific formats or patterns.
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li><strong>One-shot (one example):</strong>
                        <ul className="list-disc list-inside ml-6 space-y-1">
                            <li>"Translate the following industry terms from English to Vietnamese:
                                <ul className="list-disc list-inside ml-6 space-y-1">
                                    <li>Renewable Energy: Năng lượng tái tạo</li>
                                    <li>Grid Modernization: </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><strong>Few-shot (multiple examples):</strong>
                        <ul className="list-disc list-inside ml-6 space-y-1">
                            <li>"Classify the sentiment of the following sentences as Positive, Negative, or Neutral:
                                <ul className="list-disc list-inside ml-6 space-y-1">
                                    <li>'The project achieved its targets ahead of schedule.' {'->'} Positive</li>
                                    <li>'Equipment malfunction led to significant delays.' {'->'} Negative</li>
                                    <li>'The team is evaluating new technology options.' {'->'} Neutral</li>
                                    <li>'Our latest quarterly report shows steady growth.' {'->'} "</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><strong>Chain-of-Thought Prompting ("Think step by step"):</strong> This is incredibly powerful for complex problems that require reasoning. You ask the LLM to explain its reasoning process before giving the final answer.
                <ul className="list-disc list-inside ml-6 space-y-1">
                    <li><strong>Example:</strong> "A solar farm has 100 panels, each generating 350 watts. If it operates for 6 hours a day, how much energy (in kWh) does it produce in a month (30 days)? Let's think step by step."
                        <ul className="list-disc list-inside ml-6 space-y-1">
                            <li>The LLM will then show calculations (e.g., total watts, watts per hour, kWh per day, kWh per month) before giving the final answer. This helps verify the result and often leads to more accurate answers.</li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
        <figure className="text-center">
            <Image src="/media/prompt_engineering_flow.png" alt="Flowchart of prompt engineering process" width={600} height={400} className="mx-auto w-auto h-auto"/>
            <figcaption className="text-sm text-gray-500 mt-2">Figure 4.1: Flowchart illustrating the iterative process of prompt engineering.</figcaption>
        </figure>
        <h3 className="text-2xl font-bold text-gray-800">4.4 Iteration and Refinement - What to do when it doesn't work</h3>
        <p>Don't be discouraged if your first prompt doesn't yield perfect results. Prompt engineering is an iterative process.</p>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Repeat Key Phrases:</strong> If a concept is crucial, repeat it or emphasize it.</li>
            <li><strong>Specify Output Format:</strong> "Provide the answer as a bulleted list," "Format as a table with columns: [Header 1], [Header 2]."</li>
            <li><strong>Use All Caps (sparingly):</strong> To stress critical instructions: "DO NOT include personal opinions."</li>
            <li><strong>Try Synonyms:</strong> If "Summarize" isn't working, try "Condense," "Extract main points," or "Provide a brief overview."</li>
            <li><strong>The "Sandwich" Technique:</strong> For very long prompts, repeat your main instruction at the beginning and end.</li>
            <li><strong>Experiment:</strong> The more you experiment, the better you'll get. Keep a record of prompts that work well for specific tasks.</li>
        </ul>
    </div>
  </section>
);

const Module5 = () => (
    <section id="module5" className="p-6 bg-white rounded-lg shadow">
    <h2 className="text-3xl font-extrabold text-gray-900 mb-4">Module 5: Responsible AI Usage in the Energy Sector</h2>
    <div className="space-y-4 text-gray-700">
        <p>As powerful as these tools are, using them responsibly is paramount, especially in a critical sector like energy.</p>
        <h3 className="text-2xl font-bold text-gray-800">5.1 Ethical Considerations (Bias, fairness)</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Awareness of Bias:</strong> As mentioned, AI models can reflect biases from their training data. Be aware that the information they provide might inadvertently be skewed.</li>
            <li><strong>Fairness:</strong> Ensure that decisions or analyses influenced by AI do not lead to unfair outcomes or perpetuate inequalities, particularly when dealing with resource allocation, community impact, or workforce management.</li>
            <li><strong>Transparency:</strong> Be transparent about when and how AI tools are used in your work, especially if the output is shared externally.</li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">5.2 Data Privacy and Security</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Confidentiality is Key:</strong> Reiterate: <strong>Never, ever input sensitive, confidential, or proprietary company data into public AI chatbots.</strong> This includes project costs, proprietary designs, client lists, internal strategies, or personal employee data. Public models might use this data for future training, compromising your company's security and privacy.</li>
            <li><strong>Company Policies:</strong> Familiarize yourself with your company's specific policies regarding AI tool usage. Many organizations are developing guidelines for responsible AI adoption.</li>
            <li><strong>Data Handling:</strong> Understand that different AI tools have different data handling policies. Enterprise-level solutions often offer better data privacy guarantees.</li>
        </ul>
        <figure className="text-center">
            <Image src="/media/data_privacy_security.png" alt="Data privacy and security illustration" width={600} height={400} className="mx-auto w-auto h-auto"/>
            <figcaption className="text-sm text-gray-500 mt-2">Figure 5.1: Illustration emphasizing data privacy and security when using AI tools.</figcaption>
        </figure>
        <h3 className="text-2xl font-bold text-gray-800">5.3 Verifying Information and Critical Thinking</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>AI as a First Draft, Not a Final Authority:</strong> Treat AI-generated content as a starting point, a draft, or a source of ideas, not as verified fact.</li>
            <li><strong>Human Oversight is Essential:</strong> Always apply your professional judgment, domain expertise, and critical thinking skills to review and validate AI outputs.</li>
            <li><strong>Cross-Reference:</strong> For crucial information, cross-reference AI-generated facts with reliable sources (e.g., official reports, industry standards, validated research).</li>
            <li><strong>Consequences of Errors:</strong> Consider the potential impact of an AI error in your context. An inaccurate summary for a non-critical email is different from incorrect data used in a critical asset management decision.</li>
        </ul>
        <h3 className="text-2xl font-bold text-gray-800">5.4 Future Outlook and Staying Updated</h3>
        <ul className="list-disc list-inside space-y-2">
            <li><strong>Rapid Evolution:</strong> The field of AI and LLMs is evolving at an incredible pace. New models, capabilities, and best practices emerge constantly.</li>
            <li><strong>Continuous Learning:</strong> Stay curious and commit to continuous learning about these technologies. Follow reputable industry news, attend webinars, and experiment safely with new tools.</li>
            <li><strong>Your Role:</strong> As professionals in the energy sector, your unique domain knowledge combined with these new AI tools will enable you to drive innovation and efficiency in ways previously unimaginable. Embrace the tools, but always with a critical and responsible mindset.</li>
        </ul>
    </div>
  </section>
);
