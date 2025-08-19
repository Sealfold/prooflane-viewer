# Prooflane Viewer (Neutral, Static)

## 🎯 **Repository Purpose**

The Prooflane Viewer repository serves as the **frontend viewer application** for the entire Sealfold organization. It provides a neutral, static web-based interface for viewing and interacting with proof-of-lane verification data, ensuring consistent user experience across all verification workflows.

## 🏗️ **Core Responsibilities**

### **Frontend Application**

- **User Interface**: Modern, responsive web interface for verification data
- **Data Visualization**: Interactive charts, graphs, and data displays
- **User Experience**: Intuitive navigation and workflow management
- **Accessibility**: Inclusive design for all users

### **Verification Display**

- **Verification Results**: Clear presentation of verification outcomes
- **Workflow Status**: Real-time status updates and progress tracking
- **Data Exploration**: Interactive exploration of verification data
- **Export Capabilities**: Data export in multiple formats

### **Integration Layer**

- **API Integration**: Seamless integration with backend services
- **SDK Integration**: Client library integration for data access
- **Real-time Updates**: WebSocket integration for live data updates
- **Cross-Platform**: Responsive design for all device types

## 🔧 **Technical Architecture**

### **Frontend Stack**

```typescript
// Technology stack
const techStack = {
  framework: 'React 18+ with TypeScript',
  styling: 'Tailwind CSS with custom components',
  state: 'Zustand for state management',
  routing: 'React Router for navigation',
  charts: 'Recharts for data visualization',
  forms: 'React Hook Form for form handling',
  testing: 'Vitest and React Testing Library'
};
```

### **Core Components**

```
┌─────────────────────────────────────────────────────────┐
│                   PROOFLANE VIEWER                     │
├─────────────────────────────────────────────────────────┤
│  • User Interface & Navigation                        │
│  • Data Visualization & Charts                        │
│  • Verification Workflow Display                      │
│  • Real-time Updates & Notifications                  │
│  • Export & Sharing Capabilities                      │
└─────────────────────────────────────────────────────────┘
```

## 🔗 **Dependencies & Relationships**

### **Dependencies**

- **prooflane-spec**: Must use specification-defined data models
- **sealfold-server**: Consumes backend APIs for data access
- **prooflane-sdks**: Uses client libraries for API integration

### **Dependents**

- **sealfold-infra**: Deployed through infrastructure management
- **sealfold-studio-lite**: Integrated with development tools

## 🧠 **AI Agent Integration**

### **Viewer Agent**

The repository includes a specialized AI agent (`viewer-agent.md`) that:

- **UI Optimization**: Ensures optimal user experience and interface design
- **Frontend Integration**: Manages integration with backend and SDKs
- **Performance Monitoring**: Monitors frontend performance and optimization
- **User Experience**: Focuses on user experience and accessibility

### **Agent Capabilities**

- **Interface Validation**: Validates UI components and user experience
- **Integration Testing**: Tests integration with backend services
- **Performance Optimization**: Optimizes frontend performance
- **Accessibility Assurance**: Ensures accessibility compliance

## 📁 **Repository Structure**

```
prooflane-viewer/
├── src/
│   ├── components/          # Reusable UI components
│   ├── pages/               # Page components and routing
│   ├── hooks/               # Custom React hooks
│   ├── services/            # API and data services
│   ├── utils/               # Utility functions
│   ├── types/               # TypeScript type definitions
│   ├── styles/              # CSS and styling
│   └── assets/              # Static assets and images
├── public/                  # Public assets
├── tests/                   # Test suites
├── .cursor/
│   └── rules/               # Cursor agent rules
│       ├── viewer-agent.md  # Viewer agent rules
│       ├── org-guardrails.md # Organization guardrails
│       └── README.md        # Cursor rules overview
├── CURSOR.md                # Cursor configuration
└── README.md                # This file
```

## 🚀 **Getting Started**

### **Prerequisites**

- Node.js 18+ and npm
- Modern web browser
- Backend services running
- Environment configuration

### **Quick Start**

```bash
# Clone the repository
git clone <repository-url>
cd prooflane-viewer

# Install dependencies
npm install

# Set up environment variables
cp .env.example .env
# Edit .env with your configuration

# Start development server
npm run dev

# Run tests
npm test

# Build for production
npm run build
```

### **Environment Configuration**

```bash
# Required environment variables
VITE_API_BASE_URL=http://localhost:3001/api/v1
VITE_WS_URL=ws://localhost:3001
VITE_APP_TITLE=Prooflane Viewer

# Optional environment variables
VITE_DEBUG_MODE=false
VITE_ANALYTICS_ID=your-analytics-id
VITE_FEATURE_FLAGS=advanced-charts,export-features
```

## 🎨 **User Interface Components**

### **Core Components**

```typescript
// Main navigation component
interface NavigationProps {
  currentPage: string;
  userRole: UserRole;
  notifications: Notification[];
}

// Verification display component
interface VerificationDisplayProps {
  verification: Verification;
  showDetails: boolean;
  onExport: (format: ExportFormat) => void;
}

// Data visualization component
interface ChartComponentProps {
  data: ChartData[];
  chartType: 'line' | 'bar' | 'pie' | 'scatter';
  options: ChartOptions;
}
```

### **Component Library**

```typescript
// Reusable component examples
const Button = ({ variant, size, children, ...props }) => (
  <button 
    className={`btn btn-${variant} btn-${size}`}
    {...props}
  >
    {children}
  </button>
);

const Card = ({ title, children, actions }) => (
  <div className="card">
    <div className="card-header">
      <h3>{title}</h3>
      {actions && <div className="card-actions">{actions}</div>}
    </div>
    <div className="card-body">{children}</div>
  </div>
);
```

## 📊 **Data Visualization**

### **Chart Types**

```typescript
// Supported chart types
enum ChartType {
  LINE = 'line',
  BAR = 'bar',
  PIE = 'pie',
  SCATTER = 'scatter',
  AREA = 'area',
  HEATMAP = 'heatmap'
}

// Chart configuration
interface ChartConfig {
  type: ChartType;
  data: ChartData[];
  options: ChartOptions;
  responsive: boolean;
  animations: boolean;
}
```

### **Interactive Features**

```typescript
// Chart interaction handlers
const handleChartClick = (data: ChartClickData) => {
  if (data.activePayload) {
    const verification = data.activePayload[0].payload;
    navigateToVerification(verification.id);
  }
};

const handleChartZoom = (domain: Domain) => {
  setTimeRange({ start: domain.left, end: domain.right });
};
```

## 🔄 **Real-time Updates**

### **WebSocket Integration**

```typescript
// WebSocket connection management
class WebSocketManager {
  private ws: WebSocket;
  private reconnectAttempts = 0;
  private maxReconnectAttempts = 5;

  connect(url: string) {
    this.ws = new WebSocket(url);
    this.ws.onmessage = this.handleMessage.bind(this);
    this.ws.onclose = this.handleClose.bind(this);
  }

  private handleMessage(event: MessageEvent) {
    const data = JSON.parse(event.data);
    this.dispatchUpdate(data);
  }

  private handleClose() {
    if (this.reconnectAttempts < this.maxReconnectAttempts) {
      setTimeout(() => this.reconnect(), 1000 * Math.pow(2, this.reconnectAttempts));
      this.reconnectAttempts++;
    }
  }
}
```

### **State Management**

```typescript
// Zustand store for real-time updates
interface ViewerStore {
  verifications: Verification[];
  activeVerification: Verification | null;
  notifications: Notification[];
  updateVerification: (verification: Verification) => void;
  addNotification: (notification: Notification) => void;
}

const useViewerStore = create<ViewerStore>((set) => ({
  verifications: [],
  activeVerification: null,
  notifications: [],
  updateVerification: (verification) =>
    set((state) => ({
      verifications: state.verifications.map(v =>
        v.id === verification.id ? verification : v
      )
    })),
  addNotification: (notification) =>
    set((state) => ({
      notifications: [...state.notifications, notification]
    }))
}));
```

## 📱 **Responsive Design**

### **Breakpoint System**

```typescript
// Responsive breakpoints
const breakpoints = {
  sm: '640px',
  md: '768px',
  lg: '1024px',
  xl: '1280px',
  '2xl': '1536px'
};

// Responsive hook
const useResponsive = () => {
  const [isMobile, setIsMobile] = useState(false);
  const [isTablet, setIsTablet] = useState(false);
  const [isDesktop, setIsDesktop] = useState(false);

  useEffect(() => {
    const handleResize = () => {
      const width = window.innerWidth;
      setIsMobile(width < 768);
      setIsTablet(width >= 768 && width < 1024);
      setIsDesktop(width >= 1024);
    };

    handleResize();
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  return { isMobile, isTablet, isDesktop };
};
```

### **Mobile-First Design**

```typescript
// Mobile-optimized components
const MobileVerificationCard = ({ verification }) => (
  <div className="mobile-card">
    <div className="mobile-card-header">
      <h4>{verification.title}</h4>
      <StatusBadge status={verification.status} />
    </div>
    <div className="mobile-card-body">
      <p>{verification.description}</p>
      <div className="mobile-card-actions">
        <Button size="sm" onClick={() => viewDetails(verification.id)}>
          View Details
        </Button>
      </div>
    </div>
  </div>
);
```

## 🧪 **Testing Strategy**

### **Test Types**

- **Unit Tests**: Individual component testing
- **Integration Tests**: Component interaction testing
- **Visual Tests**: UI component visual testing
- **Accessibility Tests**: Accessibility compliance testing
- **Performance Tests**: Frontend performance testing

### **Testing Configuration**

```typescript
// Test setup
import { render, screen } from '@testing-library/react';
import { vi } from 'vitest';

// Mock API calls
vi.mock('../services/api', () => ({
  getVerifications: vi.fn(() => Promise.resolve(mockVerifications)),
  getVerification: vi.fn(() => Promise.resolve(mockVerification))
}));

// Component testing
describe('VerificationDisplay', () => {
  it('renders verification data correctly', async () => {
    render(<VerificationDisplay verification={mockVerification} />);
    
    expect(screen.getByText(mockVerification.title)).toBeInTheDocument();
    expect(screen.getByText(mockVerification.description)).toBeInTheDocument();
  });
});
```

## 📊 **Performance Optimization**

### **Code Splitting**

```typescript
// Lazy loading for routes
const VerificationPage = lazy(() => import('./pages/VerificationPage'));
const AnalyticsPage = lazy(() => import('./pages/AnalyticsPage'));

// Route configuration with lazy loading
const routes = [
  {
    path: '/verification/:id',
    element: <Suspense fallback={<LoadingSpinner />}><VerificationPage /></Suspense>
  },
  {
    path: '/analytics',
    element: <Suspense fallback={<LoadingSpinner />}><AnalyticsPage /></Suspense>
  }
];
```

### **Bundle Optimization**

```typescript
// Vite configuration for optimization
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
          charts: ['recharts'],
          utils: ['lodash', 'date-fns']
        }
      }
    }
  }
});
```

## 🔒 **Security & Privacy**

### **Data Protection**

- **Input Validation**: Comprehensive input validation and sanitization
- **XSS Prevention**: Cross-site scripting protection
- **CSRF Protection**: Cross-site request forgery protection
- **Data Encryption**: Client-side data encryption for sensitive information

### **Security Features**

```typescript
// Security utilities
const sanitizeInput = (input: string): string => {
  return DOMPurify.sanitize(input, { ALLOWED_TAGS: [] });
};

const validateData = (data: unknown): boolean => {
  try {
    return verificationSchema.validate(data);
  } catch {
    return false;
  }
};
```

## 🚀 **Deployment**

### **Build Process**

```bash
# Development build
npm run build:dev

# Production build
npm run build:prod

# Preview production build
npm run preview
```

### **Deployment Options**

```typescript
// Deployment configuration
const deploymentConfig = {
  development: {
    apiUrl: 'http://localhost:3001/api/v1',
    wsUrl: 'ws://localhost:3001',
    debug: true
  },
  staging: {
    apiUrl: 'https://staging-api.sealfold.org/api/v1',
    wsUrl: 'wss://staging-api.sealfold.org',
    debug: false
  },
  production: {
    apiUrl: 'https://api.sealfold.org/api/v1',
    wsUrl: 'wss://api.sealfold.org',
    debug: false
  }
};
```

## 🔮 **Future Enhancements**

### **Phase 1: Core Features (Current)**

- ✅ Basic verification display
- ✅ Responsive design
- ✅ Real-time updates
- ✅ Data visualization

### **Phase 2: Advanced Features (Next Quarter)**

- 🔄 Advanced charting capabilities
- 🔄 Export and sharing features
- 🔄 Offline support
- 🔄 Performance optimization

### **Phase 3: Enterprise Features (Future)**

- 📋 Advanced analytics dashboard
- 📋 Custom visualization builder
- 📋 Multi-language support
- 📋 Advanced accessibility features

## 🤝 **Contributing**

### **Development Guidelines**

- **Code Standards**: Follow established coding standards
- **Component Design**: Create reusable, accessible components
- **Testing**: Write comprehensive tests for all components
- **Documentation**: Update documentation for UI changes

### **Development Workflow**

1. **Fork**: Fork the repository
2. **Branch**: Create feature branch
3. **Develop**: Implement changes with tests
4. **Test**: Ensure all tests pass
5. **Submit**: Submit pull request
6. **Review**: Address review feedback
7. **Merge**: Merge approved changes

## 📞 **Support & Contact**

### **Getting Help**

- **Documentation**: Check comprehensive UI documentation
- **Issues**: Report issues in the repository
- **Team Support**: Contact frontend team for assistance
- **Agent Support**: Use Viewer Agent for guidance

### **Team Contact**

- **Frontend Team**: <frontend@sealfold.org>
- **Technical Questions**: <tech@sealfold.org>
- **General Inquiries**: <info@sealfold.org>

---

**Last Updated**: August 13, 2025  
**Maintained By**: Sealfold Frontend Team  
**Contact**: <frontend@sealfold.org>

*The Prooflane Viewer repository provides the user-facing interface for the entire verification system. By delivering an intuitive, responsive, and accessible user experience, we ensure that users can effectively interact with and understand their verification data.* 🚀
